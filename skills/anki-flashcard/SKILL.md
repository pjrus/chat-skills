---
name: anki-flashcard
description: Generate Anki-ready flashcards with properly formatted MathJax for use in Anki 2.1+. Use this skill whenever the user asks to "make a flashcard", "make an Anki card", "turn this into a flashcard", or wants to study/memorise content in Anki format — even if they don't say "Anki" explicitly. Always use this skill when the content involves mathematical formulas that need to render in Anki.
---

# Anki Flashcard Skill

Generate one or more Anki flashcards from the provided content, formatted for direct paste into the Anki card editor.

## Output format

Each card is wrapped in a fenced code block for easy copying. Use this structure:

~~~
```
Front:
<question text>

Back:
<answer text>
```
~~~

Separate multiple cards with a `---` divider.

## MathJax delimiters

Anki 2.1+ renders MathJax natively. Use these delimiters — NOT standard LaTeX `$...$` or `$$...$$`:

| Type | Delimiter | Example |
|------|-----------|---------|
| Inline | `\(...\)` | `\(p_i \log_2(p_i)\)` |
| Block (centered) | `\[...\]` | `\[\sum_{i=1}^{c} p_i\]` |

Never use `$...$` or `$$...$$` — Anki does not recognise them.

## Card writing guidelines

- **Front**: one clear, specific question. Avoid vague prompts like "what is X?" — prefer "what is the formula for X?" or "what are the steps to compute X?"
- **Back**: direct answer first, then supporting detail (derivation, notation key, worked example). Do not pad with unnecessary prose.
- **Notation keys**: after a formula, list what each symbol means using `- \(symbol\) = meaning` bullets.
- **Worked examples**: include a short numeric example on the back when it helps build intuition.
- **Atomicity**: one testable fact per card. Split compound concepts into separate cards.
- **No tables**: never use Markdown tables. Use plain text, bullet lists, or indented structure instead.
- **Cloze cards**: if the user asks for cloze deletion format, use `{{c1::hidden text}}` syntax on both front and back fields (Anki cloze note type).

## Example card (math)

```
Front:
What is the formula for entropy of a set \(S\) with \(c\) classes?

Back:
\[E(S) = -\sum_{i=1}^{c} p_i \log_2(p_i)\]

Where:
- \(p_i\) = proportion of examples in class \(i\)
- Ranges from \(0\) (pure) to \(1\) (maximally impure)
- Convention: \(0 \cdot \log_2(0) = 0\)

Example (9 yes / 5 no):
\[E(S) = -\frac{9}{14}\log_2\left(\frac{9}{14}\right) - \frac{5}{14}\log_2\left(\frac{5}{14}\right) = 0.9403\]
```

## Backslash rules (critical)

- ALL MathJax delimiters use a SINGLE backslash: `\(`, `\)`, `\[`, `\]`
- LaTeX commands inside delimiters also use a single backslash: `\sum`, `\frac`, `\cdot`, `\log`, `\left`, `\right`, `\text`, etc.
- Never use double backslash `\\` anywhere in Anki MathJax.

## Example card (non-math)

```
Front:
What does ID3 use as its splitting criterion when building a decision tree?

Back:
Information gain — it selects the attribute that produces the greatest
reduction in entropy (i.e. the purest class breakdown) at each split.
```


