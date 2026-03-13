# agentic-dev-boilerplate

A ready-to-use file setup for AI-native development. Includes a curated set of agent skills covering the full engineering workflow — from planning and implementation through testing, review, performance, accessibility, SEO, and deployment.

Built on personal time with personal resources. Free for anyone to use, copy, modify, or build on — including commercially. MIT licensed.

## What's included

- `AGENTS.md` / `CLAUDE.md` — project context loaded automatically by AI coding agents
- `skills/` — 36 workflow skills the agent loads on demand
- `references/` — shared checklists loaded alongside skills
- `.claude/commands/` — slash commands for common workflows (`/spec`, `/plan`, `/build`, `/test`, `/review`, `/ship`)
- `.claude/hooks/` — automation scripts that run on every session (see below)

## Hooks

Four hooks run automatically on every Claude session. They require **Python 3** to be available in your shell.

| Hook | When | What it does |
|------|------|-------------|
| `session-story.py` | After each response | Appends problem, decisions, and file changes to `project-story/YYYY-MM-DD.md` — builds a narrative journal for case studies and post-mortems |
| `protect-sensitive.py` | Before any file write | Blocks writes to `.env*`, `*.pem`, `*.key`, and migration files |
| `bash-guard.py` | Before any shell command | Blocks `rm -rf`, `git push --force`, `DROP TABLE`, and other destructive commands |
| `pre-commit-check.py` | Before `git commit` | Runs your test suite and blocks the commit if tests fail — set `TEST_COMMAND` in the script |
| `reinject-conventions.py` | After context compaction | Re-injects `AGENTS.md` so the agent doesn't drift from project conventions mid-session |

The session journal is gitignored by default. Remove the `project-story/` line from `.gitignore` if you want to commit it alongside the code.

## Usage

1. Clone or copy the repo into your project root
2. Trim the skills table in `AGENTS.md` to remove skills that don't apply to your project
3. Add your stack's formatter to `.claude/hooks/` if you want auto-formatting on file save
4. Your AI coding agent will pick up `AGENTS.md` automatically

## License

MIT — see [LICENSE](LICENSE).
