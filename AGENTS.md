# agentic-dev-boilerplate

## Skills

Engineering workflows are in [`skills/`](skills/). Load the relevant skill when the task matches. Do not load all of them upfront.

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

## Boundaries

- **Ask first:** Adding dependencies, changing project structure, making architectural decisions
- **Never:** Commit secrets, skip tests, make changes outside the agreed spec
