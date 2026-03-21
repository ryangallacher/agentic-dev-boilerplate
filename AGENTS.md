# agentic-dev-boilerplate

## Skills

Engineering workflows are in [`skills/`](skills/). **Before starting any task, identify which skills apply from the table below and read them. Do not begin implementation without loading the relevant skill first.** If no skill clearly matches, say so rather than proceeding without guidance. Do not load all skills upfront — only what the current task requires.

This is a boilerplate — it contains the full set of skills across all project types. Once a spec exists for this project, remove skills from this table that don't apply to what's being built.

| Skill | When to use |
|-------|-------------|
| [spec-driven-development](skills/spec-driven-development/SKILL.md) | Starting a new feature with unclear requirements |
| [planning-and-task-breakdown](skills/planning-and-task-breakdown/SKILL.md) | Breaking work into verifiable tasks |
| [incremental-implementation](skills/incremental-implementation/SKILL.md) | Implementing any multi-file change |
| [test-driven-development](skills/test-driven-development/SKILL.md) | Implementing logic or fixing bugs |
| [debugging-and-error-recovery](skills/debugging-and-error-recovery/SKILL.md) | Tests fail, builds break, unexpected errors |
| [code-review-and-quality](skills/code-review-and-quality/SKILL.md) | Before merging any change |
| [rg-ui-standards](skills/rg-ui-standards/SKILL.md) | Any UI work — load this alongside frontend-ui-engineering, it takes precedence on design decisions |
| [frontend-ui-engineering](skills/frontend-ui-engineering/SKILL.md) | Building or modifying UI components |
| [api-and-interface-design](skills/api-and-interface-design/SKILL.md) | Designing APIs or module boundaries |
| [security-and-hardening](skills/security-and-hardening/SKILL.md) | Handling user input, auth, or sensitive data |
| [performance-optimization](skills/performance-optimization/SKILL.md) | Performance requirements or suspected regressions |
| [browser-testing-with-devtools](skills/browser-testing-with-devtools/SKILL.md) | Debugging anything in a browser |
| [git-workflow-and-versioning](skills/git-workflow-and-versioning/SKILL.md) | Committing, branching, resolving conflicts |
| [ci-cd-and-automation](skills/ci-cd-and-automation/SKILL.md) | Setting up or modifying build/deploy pipelines |
| [documentation-and-adrs](skills/documentation-and-adrs/SKILL.md) | Architectural decisions or documenting APIs |
| [shipping-and-launch](skills/shipping-and-launch/SKILL.md) | Preparing to deploy |
| [idea-refine](skills/idea-refine/SKILL.md) | Refining vague ideas into actionable plans |
| [web-quality-audit](skills/web-quality-audit/SKILL.md) | Full site audit across performance, accessibility, SEO, and best practices |
| [performance](skills/performance/SKILL.md) | Loading speed, runtime efficiency, resource optimization |
| [core-web-vitals](skills/core-web-vitals/SKILL.md) | LCP, INP, CLS metric diagnosis and optimization |
| [accessibility](skills/accessibility/SKILL.md) | WCAG 2.1 compliance, keyboard nav, ARIA, screen readers |
| [seo](skills/seo/SKILL.md) | Crawlability, on-page SEO, structured data |
| [best-practices](skills/best-practices/SKILL.md) | Security headers, modern APIs, browser compatibility |
| [pptx](skills/pptx/SKILL.md) | Creating or editing PowerPoint decks, slides, pitches, or presentations |
| [security-auditor](skills/security-auditor/SKILL.md) | Deep security audit — threat modelling, vulnerability review, pen-test style analysis |
| [senior-code-reviewer](skills/senior-code-reviewer/SKILL.md) | Staff-engineer-level review covering architecture, maintainability, and long-term impact |
| [test-engineer](skills/test-engineer/SKILL.md) | Designing or overhauling a test strategy — coverage gaps, test architecture, CI integration |
| [react-best-practices](skills/react-best-practices/SKILL.md) | Writing, reviewing, or refactoring React or Next.js code for performance |
| [composition-patterns](skills/composition-patterns/SKILL.md) | Refactoring components with boolean prop proliferation or designing reusable component APIs |
| [react-native-guidelines](skills/react-native-guidelines/SKILL.md) | Building React Native or Expo mobile apps |
| [copilot-sdk](skills/copilot-sdk/SKILL.md) | Building applications powered by GitHub Copilot programmatically |
| [skill-creator](skills/skill-creator/SKILL.md) | Creating or updating a skill in this boilerplate |
| [database-and-migrations](skills/database-and-migrations/SKILL.md) | Schema design, migrations, ORM patterns (Prisma/Drizzle), and query optimization |
| [typescript-patterns](skills/typescript-patterns/SKILL.md) | Type design, generics, discriminated unions, and avoiding common TS pitfalls |
| [observability-and-monitoring](skills/observability-and-monitoring/SKILL.md) | Structured logging, Sentry error tracking, metrics, and alerting |
| [environment-and-config](skills/environment-and-config/SKILL.md) | .env discipline, secrets handling, runtime config validation, and feature flags |

## References

Supporting checklists — load alongside the relevant skill when you need concrete checks or patterns:

| Reference | Load with |
|-----------|-----------|
| [accessibility-checklist](references/accessibility-checklist.md) | `accessibility`, `frontend-ui-engineering` |
| [performance-checklist](references/performance-checklist.md) | `performance`, `web-quality-audit` |
| [security-checklist](references/security-checklist.md) | `security-and-hardening`, `security-auditor` |
| [testing-patterns](references/testing-patterns.md) | `test-driven-development`, `test-engineer` |
| [mental-health-ux-patterns](references/mental-health-ux-patterns.md) | `accessibility`, `frontend-ui-engineering` — when building for vulnerable users |

## Hooks

Five hooks run automatically on every session via `.claude/hooks/`. Do not disable them without good reason.

| Hook | Event | Purpose |
|------|-------|---------|
| `session-story.py` | `SessionEnd` | Journals the session to `project-story/` — problem, decisions, files changed |
| `protect-sensitive.py` | `PreToolUse` (Write/Edit) | Blocks writes to `.env*`, keys, certs, migration files |
| `bash-guard.py` | `PreToolUse` (Bash) | Blocks destructive shell commands |
| `pre-commit-check.py` | `PreToolUse` (Bash) | Runs test suite before `git commit` — set `TEST_COMMAND` in the script when starting a project |
| `reinject-conventions.py` | `SessionStart` (compact) | Re-injects this file after context compaction |

## Agentic patterns

**When to use plan mode**
Use plan mode (`/plan` or Shift+Tab to toggle) before any task that touches multiple files, changes an API boundary, or could be hard to reverse. Plan mode lets you review and correct the approach before anything executes. Switch back to normal mode once the plan is agreed.

**When to spawn subagents**
Subagents are separate agents with their own context window, spawned via the Agent tool. Use them when:
- Two searches or research tasks can run in parallel and don't depend on each other
- A task would produce so much output (large file reads, broad searches) it would flood the main context
- You need a specialised agent — `Explore` for codebase search, `Plan` for architecture design

Do not spawn a subagent for simple sequential tasks. A subagent returns one message — there is no back-and-forth. If the task needs iteration, keep it in the main context.

**Subagent types available**
- `Explore` — fast codebase search and exploration
- `Plan` — architecture and implementation planning
- `general-purpose` — research, multi-step tasks, web search

**Context window discipline**
Prefer targeted reads (specific file + line range) over broad ones. When a task is complete, summarise what was done before context grows too large — this gives the compaction hook better material to work with and keeps re-injected context clean.

**MCP servers**
Model Context Protocol servers extend what the agent can connect to — databases, APIs, internal tools — without shell commands. Add project-specific MCP servers to `.claude/settings.json` under `mcpServers` when you need the agent to query live data directly.

## Information Architecture

When new information, documentation, or research arrives — use this table to decide where it goes. Prefer repo-local, agent-agnostic locations over agent-specific memory.

| Type of content | Where it goes | Notes |
|----------------|---------------|-------|
| Architectural or strategic decisions | `references/` | Agent-readable, load alongside relevant skill |
| Specs for new features | `spec.md` or `specs/` | Written before implementation begins |
| ADRs | `docs/decisions/` | When a decision needs permanent record with context |
| Checklists and process references | `references/` | Load alongside skills when needed |
| Agent skills and workflows | `skills/` | One skill per directory, `SKILL.md` inside |
| Hooks and automation | `.claude/hooks/` | Document in AGENTS.md hooks table |
| Project story / session journal | `project-story/` | Auto-generated — do not edit manually |
| Research or external articles | `references/` | Summarise key points and relevance — don't just link |
| Sensitive config, secrets, env vars | `.env` (never committed) | See `protect-sensitive.py` hook |

**Rules:**
- Repo-local always beats agent-specific memory. If it's worth keeping, it belongs in the repo.
- `references/` is for agent consumption — write declaratively, one topic per file, no narrative prose.
- Do not create a `docs/` file when `references/` would do.
- If content doesn't fit any category above, ask before creating a new top-level directory.

## Principles

- **Agent agnostic by default:** Any tooling, config, docs, or conventions should work across agents (Claude, Cursor, Copilot, etc.) unless there's a specific reason to go agent-specific. Prefer `AGENTS.md` over `CLAUDE.md`, repo-local files over agent memory, and open formats over proprietary ones.

## Boundaries

- **Ask first:** Adding dependencies, changing project structure, making architectural decisions
- **Never:** Commit secrets, skip tests, make changes outside the agreed spec
