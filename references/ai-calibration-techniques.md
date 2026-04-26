# AI Calibration Techniques

Use these when you need the model to surface genuine uncertainty, pressure-test an answer, or move beyond confident-sounding text into accurate reasoning. Ranked by impact on actual accuracy — not tone or expression.

## S tier — shifts reasoning quality

**Chain-of-thought before answer**
Ask the model to reason through the problem before giving the answer. Well-documented accuracy improvement. The reasoning itself becomes context that constrains the final answer.
> "Think through this step by step before answering."

**Inconsistency test**
Ask the same question with opposite framing. Disagreement between answers reveals genuine uncertainty — the model doesn't actually know. Agreement under opposing frames is a reliable confidence signal.
> Ask "is X the right approach?" then separately ask "what's wrong with X?"

## A tier — surfaces real uncertainty

**"What would change your answer?"**
Forces the model to map what it's actually uncertain about. More reliable than asking for a confidence score.

**"What's the strongest counterargument?"**
Activates genuinely different reasoning paths rather than hedging around the original answer.

**Multiple sampling**
Ask the same question several times or across separate conversations. Variance in answers is a reliable uncertainty signal. Consistency is a better confidence indicator than any explicit confidence claim.

## B tier — useful, unreliable alone

**"What's the probability this is wrong?"**
Useful for surfacing uncertainty but model calibration is imperfect — treat as a signal, not a measurement.

**Audience framing**
"A senior practitioner with 20 years experience will act on this answer." Mild documented effect — shifts register and reduces overconfident shortcuts. Not a substitute for A-tier techniques.

## C/D tier — shifts tone only, avoid

**"Be honest" / "don't hallucinate"** — the model is always predicting the most likely next token. This instruction changes nothing mechanistically.

---

## The key distinction

Confidence expression and correctness are independent in language models. S and A tier techniques shift actual reasoning. C/D tier techniques shift surface expression only — they make wrong answers sound more certain.
