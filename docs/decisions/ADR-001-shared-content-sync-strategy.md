# ADR-001: Shared content and sync strategy across project repos

## Status
Accepted

## Date
2026-03-21

## Context

Multiple project repos (sense-check, rg-design-system, crp-tool-postmvp) are created from `agentic-dev-boilerplate`. Each repo needs:

- Consistent agent tooling: hooks, commands, skills
- Access to shared reference documents (checklists, patterns)
- A way to receive updates from the boilerplate without manual copy-paste

Additionally, `ryan-gallacher-portfolio` holds Ryan's professional voice and case study templates, which need to be accessible to individual project agents without being duplicated into each repo.

Key constraints:
- Projects may need project-specific skills and references alongside boilerplate ones
- Boilerplate skills must stay canonical — project-level edits would create drift
- `knowledge/` directories are project-specific and must never be overwritten
- The portfolio repo (`ryan-gallacher-portfolio`) is separate from the boilerplate — it's not a boilerplate-derived project

## Decision

### Boilerplate → project sync via `sync.sh`

`sync.sh` propagates the following from `agentic-dev-boilerplate` to each project listed in `sync-targets.txt`:

- `.claude/hooks/` — all hook scripts (unconditional overwrite)
- `.claude/commands/` — all commands except `setup.md` (unconditional overwrite)
- `settings.json` — only the `hooks` key is merged; project permissions are preserved
- `skills/` — all skills, recursively (unconditional overwrite)
- `references/` — all `.md` files (unconditional overwrite)

`knowledge/` is explicitly excluded — it is project-specific.

### Project-specific skills

Projects must never modify boilerplate skills — they will be overwritten on next sync. To add project-specific behaviour, create a new skill with a distinct name alongside the boilerplate ones (e.g. `skills/my-project-domain/`).

### Shared voice and templates via path reference

`voice.md` and `case-study-template.md` live exclusively in `ryan-gallacher-portfolio`. Projects that need access (e.g. sense-check for tone-of-voice work) reference these files by absolute path. No copying, no syncing of these files into other repos.

## Alternatives Considered

### Copy `voice.md` into each project
- Pros: No cross-repo path dependency, works offline per-repo
- Cons: Immediately creates drift — edits to the canonical file don't propagate, Ryan ends up with multiple diverging versions
- Rejected: Single source of truth matters more for a personal voice document

### Sync `voice.md` via `sync.sh`
- Pros: Consistent updates, same mechanism as hooks and skills
- Cons: `voice.md` is personal content, not tooling — conflates two different concerns. `sync-targets.txt` would need to know about non-boilerplate repos. Portfolio repo is not a boilerplate-derived project.
- Rejected: Wrong conceptual layer

### Sync `knowledge/` from boilerplate
- Pros: Shared domain knowledge across projects
- Cons: `knowledge/` is the most project-specific content that exists — overwriting it would destroy project context that took time to build
- Rejected: Too destructive. `references/` (agent-readable checklists and patterns) is the correct layer for shared knowledge

### Separate npm/package registry for shared skills
- Pros: Versioned, dependency-managed
- Cons: Massive overhead for a solo developer. Skills are markdown files — a file copy is the right primitive.
- Rejected: Over-engineered for current scale

## Trade-offs

What we are accepting by making this choice:

- **Path coupling**: Projects that reference `voice.md` by path break if the portfolio repo moves or is renamed. Acceptable — the portfolio repo is stable and this is a solo setup.
- **No versioning on sync**: `sync.sh` is always latest-from-boilerplate. There's no rollback if a hook change breaks a project. Mitigated by git history in the boilerplate.
- **Manual sync trigger**: `sync.sh` must be run manually (or in a dev workflow). No auto-sync on boilerplate commits. Acceptable for current scale.
- **Flat references/**: All boilerplate references land in `references/` with no namespacing. Name collisions with project-specific references are possible — mitigated by the convention that project references use descriptive, project-specific names.

## Consequences

- All boilerplate-derived projects get consistent hook behaviour on next sync
- New skills added to the boilerplate automatically propagate to all projects on next sync run
- Ryan can maintain one canonical voice document and all projects can access it
- The sync script is idempotent — running it is always safe, even if nothing changed

## Results
<!-- Fill in after this has been in use for a while -->
