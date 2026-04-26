# Epistemic Framing

How to steer the model toward non-obvious, practitioner-quality answers without naming specific sources or relying solely on the knowledge base.

## The problem

The model defaults to the highest-probability answer — which is usually consensus. Consensus is the floor, not the ceiling. The gap between consensus and practitioner insight is where the value is.

Two failure modes:
- **Default bias** — recommends the most common solution without checking if it fits
- **Training distribution bias** — misses better solutions underrepresented in training data

## Describe the shape, not the source

You can't name the practitioner, but you can describe their epistemic profile — the stance they take, the audience they assume, the things they refuse to say.

Instead of naming a source, describe:
- The reasoning style: "thinking grounded in observed behaviour, not design convention"
- The audience: "for someone who has shipped enough times to see the consensus fail"
- What it refuses to do: "not advice that could appear in a listicle or portfolio showcase"
- The stance: "examines where conventional wisdom breaks down in practice"

## Anti-signals outperform positive framing

Ruling out high-probability outputs is more reliable than asking for low-probability ones. The model finds it easier to avoid named patterns than to generate unnamed ones.

> "Not design community consensus, not portfolio aesthetics, not advice that could appear in a listicle."

is more reliable than:

> "Give me a non-obvious answer."

## Consensus as floor, not ceiling

Don't lead with consensus then try to depart from it — consensus-first anchors the vocabulary and framing even when trying to go beyond it.

Instead, frame the answer as: **where established thinking and practitioner experience diverge** — not two sequential phases, but a single move that holds both.

The model's centre of gravity is consensus. You have to work to move away from it, but it snaps back easily. Starting niche is more efficient for generation tasks — you can always ask "what does mainstream thinking say?" and get it instantly.

## Task-type determines starting point

- **Evaluation / diagnosis tasks** (is this right, review this, what's wrong) → generic-first. The consensus answer may be correct; you need the baseline to evaluate the departure.
- **Generation / design tasks** (build this, what should this be, design this) → niche-first. Consensus contaminates generative work by anchoring vocabulary before direction is set.

## Knowledge base vs. epistemic framing

These serve different functions — use both:

- **Epistemic framing** activates the practitioner's stance and reasoning style from training data at scale. Good for tone, register, and mode of reasoning.
- **Knowledge base** captures specific non-obvious conclusions the model wouldn't reliably surface even with perfect framing. Good for particular frameworks, critiques, or insights from underrepresented sources.

The knowledge base earns its place only when framing alone would fail to surface the content. If the model would reliably get there with good framing, the file adds token cost with no behaviour change.
