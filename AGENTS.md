# agentic-dev-boilerplate

## Skills

Engineering workflows are in [`skills/`](skills/). Load the relevant skill when the task matches. Do not load all of them upfront.

| Skill | When to use |
|-------|-------------|
| [spec-driven-development](skills/spec-driven-development/SKILL.md) | Starting a new feature with unclear requirements |
| [planning-and-task-breakdown](skills/planning-and-task-breakdown/SKILL.md) | Breaking work into verifiable tasks |
| [incremental-implementation](skills/incremental-implementation/SKILL.md) | Implementing any multi-file change |
| [test-driven-development](skills/test-driven-development/SKILL.md) | Implementing logic or fixing bugs |
| [debugging-and-error-recovery](skills/debugging-and-error-recovery/SKILL.md) | Tests fail, builds break, unexpected errors |
| [code-review-and-quality](skills/code-review-and-quality/SKILL.md) | Before merging any change |
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
| [context-engineering](skills/context-engineering/SKILL.md) | Agent output quality is degrading or context needs reset |
| [web-quality-audit](skills/web-quality-audit/SKILL.md) | Full site audit across performance, accessibility, SEO, and best practices |
| [performance](skills/performance/SKILL.md) | Loading speed, runtime efficiency, resource optimization |
| [core-web-vitals](skills/core-web-vitals/SKILL.md) | LCP, INP, CLS metric diagnosis and optimization |
| [accessibility](skills/accessibility/SKILL.md) | WCAG 2.1 compliance, keyboard nav, ARIA, screen readers |
| [seo](skills/seo/SKILL.md) | Crawlability, on-page SEO, structured data |
| [best-practices](skills/best-practices/SKILL.md) | Security headers, modern APIs, browser compatibility |

## Boundaries

- **Ask first:** Adding dependencies, changing project structure, making architectural decisions
- **Never:** Commit secrets, skip tests, make changes outside the agreed spec
