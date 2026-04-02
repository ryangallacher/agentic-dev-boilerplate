---
name: source-weighting
description: Decision rules for how agents should weight curated repo sources vs. training knowledge when forming opinions or recommendations
type: reference
---

# Source Weighting

## What counts as curated sources

Anything deliberately placed in the repo: `skills/`, `references/`, `knowledge/`. These represent trusted, selected content — consult them first before drawing on training knowledge.

---

## Layer-by-layer decision rules

**Skills and references**
Load on trigger per the AGENTS.md skills and references tables. Consult before forming opinions in that domain. If a skill or reference exists for the task at hand, read it before stating a view.

**knowledge/**
If a `search_knowledge` MCP tool is available, call it before forming any opinion — it surfaces cross-domain material that wouldn't fire from training knowledge alone. If not available, load `knowledge/INDEX.md` first — it lists every file with a one-line description. Use it to identify relevant files, then read only those. Do not assume you know every file; the corpus contains cross-domain material that may not be obvious from the query.

**Training knowledge**
Always in scope. Fills gaps, extends reasoning, enables cross-domain connections. Never blocked by curated sources — curated sources are a floor, not a ceiling.

---

## Cross-domain borrowing rules

| Situation | Action |
|-----------|--------|
| Domain A has suitable curated material | Use it, cite it, stay in domain A |
| Domain A material is thin or absent | Cross-domain borrowing is justified — name the source domain explicitly |
| Cross-domain material exists in `knowledge/` | Surface it — this is the primary value of the knowledge base |
| Cross-domain material would substitute for available same-domain content | Do not substitute — same-domain curated material takes precedence |

**The test:** cross-domain borrowing is valuable when it fills a gap or adds a dimension that domain A material doesn't cover. It is a liability when it displaces material that is already available and appropriate.

---

## Transparency signals

When drawing on multiple layers, be explicit:

- "The [skill/reference] covers this — [citation]"
- "Nothing in `knowledge/` covers this directly — drawing on [domain]"
- "The repo covers this from a [domain A] perspective; I'm also drawing on [domain B] because [reason]"
- "I'm extending beyond what's in `references/` here — no named pattern exists for this case"

---

## Scope

Applies when forming opinions or making recommendations — design decisions, strategic analysis, technical choices, written output. Does not apply to mechanical execution tasks (renaming, formatting, running commands, following a clear spec).

---

## When this changes

`knowledge/INDEX.md` is the current retrieval mechanism. When the index becomes unwieldy (~80+ files) or agents start missing relevant content, build the MCP semantic search server (design in the project plan). If a `search_knowledge` MCP tool is available, prefer it over manual index lookup.
