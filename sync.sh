#!/usr/bin/env bash
# sync.sh — propagate core .claude files from this boilerplate to sibling projects
#
# Usage:
#   ./sync.sh                        # dry run — shows what would change
#   ./sync.sh --apply                # apply changes
#   ./sync.sh --apply path/to/repo   # apply to a specific repo only
#
# What gets synced (core = safe to overwrite on any project):
#   .claude/hooks/        — all hook scripts
#   .claude/commands/     — all commands except setup.md
#   settings.json hooks   — only the "hooks" key is merged; permissions are preserved
#   skills/               — all boilerplate skills (never modify these in a project — create new ones instead)
#   references/           — shared checklists and references (knowledge/ is NOT synced — it is project-specific)
#
# Which projects get synced:
#   Defined in sync-targets.txt — add a project there when you create it from this template.

set -euo pipefail

# Resolve python command (python3 on mac/linux, python on windows)
PYTHON=$(command -v python3 2>/dev/null || command -v python 2>/dev/null || echo "")
if [[ -z "$PYTHON" ]]; then
  echo "Error: python3 or python not found in PATH"
  exit 1
fi

BOILERPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$BOILERPLATE_DIR")"

# Convert path to format Python can open (needed on Windows/Git Bash)
to_py_path() {
  if command -v cygpath &>/dev/null; then
    cygpath -w "$1"
  else
    echo "$1"
  fi
}

APPLY=false
EXPLICIT_TARGET=""

for arg in "$@"; do
  if [[ "$arg" == "--apply" ]]; then
    APPLY=true
  else
    EXPLICIT_TARGET="$arg"
  fi
done

# Build target list from sync-targets.txt (repos created from this template)
if [[ -n "$EXPLICIT_TARGET" ]]; then
  TARGETS=("$EXPLICIT_TARGET")
else
  TARGETS_FILE="$BOILERPLATE_DIR/sync-targets.txt"
  if [[ ! -f "$TARGETS_FILE" ]]; then
    echo "sync-targets.txt not found. Create it with one repo name per line."
    exit 1
  fi
  TARGETS=()
  while IFS= read -r line; do
    [[ -z "$line" || "$line" == \#* ]] && continue
    target="$PARENT_DIR/$line"
    if [[ ! -d "$target" ]]; then
      echo "Warning: $line not found at $target, skipping"
      continue
    fi
    TARGETS+=("$target")
  done < "$TARGETS_FILE"
fi

if [[ ${#TARGETS[@]} -eq 0 ]]; then
  echo "No target repos found."
  exit 0
fi

CHANGED=false

sync_file() {
  local src="$1"
  local dst="$2"
  local label="$3"

  if [[ ! -f "$dst" ]]; then
    echo "  + $label (new)"
    CHANGED=true
    if $APPLY; then
      mkdir -p "$(dirname "$dst")"
      cp "$src" "$dst"
    fi
  elif ! diff -q "$src" "$dst" > /dev/null 2>&1; then
    echo "  ~ $label (changed)"
    CHANGED=true
    if $APPLY; then
      cp "$src" "$dst"
    fi
  fi
}

merge_settings_hooks() {
  local boilerplate_settings="$1"
  local target_settings="$2"
  local label="settings.json hooks"

  if [[ ! -f "$target_settings" ]]; then
    echo "  ! $label — target settings.json not found, skipping"
    return
  fi

  local src_py dst_py
  src_py="$(to_py_path "$boilerplate_settings")"
  dst_py="$(to_py_path "$target_settings")"

  local diff_output
  diff_output=$($PYTHON - <<EOF
import json, sys

with open(r"$src_py") as f:
    src = json.load(f)
with open(r"$dst_py") as f:
    dst = json.load(f)

if src.get("hooks", {}) == dst.get("hooks", {}):
    sys.exit(0)

print("hooks section differs")
sys.exit(1)
EOF
  ) || true

  if [[ -z "$diff_output" ]]; then
    return
  fi

  echo "  ~ $label (changed)"
  CHANGED=true

  if $APPLY; then
    $PYTHON - <<EOF
import json

with open(r"$src_py") as f:
    src = json.load(f)
with open(r"$dst_py") as f:
    dst = json.load(f)

dst["hooks"] = src.get("hooks", {})

with open(r"$dst_py", "w") as f:
    json.dump(dst, f, indent=2)
    f.write("\n")
EOF
    echo "    applied"
  fi
}

for target in "${TARGETS[@]}"; do
  repo_name="$(basename "$target")"
  echo ""
  echo "[$repo_name]"

  for src in "$BOILERPLATE_DIR/.claude/hooks/"*.py; do
    filename="$(basename "$src")"
    sync_file "$src" "$target/.claude/hooks/$filename" "hooks/$filename"
  done

  for src in "$BOILERPLATE_DIR/.claude/commands/"*.md; do
    filename="$(basename "$src")"
    [[ "$filename" == "setup.md" ]] && continue
    sync_file "$src" "$target/.claude/commands/$filename" "commands/$filename"
  done

  merge_settings_hooks \
    "$BOILERPLATE_DIR/.claude/settings.json" \
    "$target/.claude/settings.json"

  sync_file "$BOILERPLATE_DIR/.mcp.json" "$target/.mcp.json" ".mcp.json"

  # Sync skills/ recursively (never modify boilerplate skills in projects — create new ones instead)
  if [[ -d "$BOILERPLATE_DIR/skills" ]]; then
    while IFS= read -r src; do
      relative="${src#$BOILERPLATE_DIR/}"
      sync_file "$src" "$target/$relative" "$relative"
    done < <(find "$BOILERPLATE_DIR/skills" -type f)
  fi

  # Sync references/ (project-specific references are safe — they have distinct names)
  if [[ -d "$BOILERPLATE_DIR/references" ]]; then
    for src in "$BOILERPLATE_DIR/references/"*.md; do
      [[ -f "$src" ]] || continue
      filename="$(basename "$src")"
      sync_file "$src" "$target/references/$filename" "references/$filename"
    done
  fi

  if ! $CHANGED; then
    echo "  (up to date)"
  fi
  CHANGED=false
done

echo ""
if ! $APPLY; then
  echo "Dry run complete. Run with --apply to apply changes."
fi
