# Note templates

Contents: Concept or study note, Meeting note, Project note, Daily note, Literature note, MOC (index).

Fill every placeholder with real content. Delete sections that have nothing to say rather than leaving them empty. Replace dates with the real date.

## Concept or study note

Filename: the concept name, e.g. `Gradient Descent.md`.

```md
---
tags:
  - course/unit-code
  - concept
aliases:
  - Short name
created: YYYY-MM-DD
source: "[[Week 3 Lecture]]"
---

> [!abstract] In one line
> One-sentence definition in plain words.

## Intuition

Plain-language explanation, then an analogy if it helps.

## Definition

$$
\theta_{t+1} = \theta_t - \eta \nabla_\theta L(\theta_t)
$$

Explain each symbol in a short list.

- $\theta$: parameters
- $\eta$: learning rate

## Worked example

> [!example] Example
> Step-by-step working.

## Common mistakes

> [!warning]
> What people get wrong.

## Check yourself

> [!question]- Question?
> Answer.

## Related

- [[Linked Concept]]
```

## Meeting note

Filename: `YYYY-MM-DD Meeting Title.md`.

```md
---
tags:
  - meeting
date: YYYY-MM-DD
attendees:
  - Name
  - Name
project: "[[Project Name]]"
---

## Agenda

- Item

## Notes

- Discussion point

## Decisions

> [!success] Decided
> The decision and who owns it.

## Action items

- [ ] Task, owner, due date
- [ ] Task, owner, due date

## Next meeting

YYYY-MM-DD
```

## Project note

Filename: the project name.

```md
---
tags:
  - project
status: active
started: YYYY-MM-DD
due: YYYY-MM-DD
---

> [!abstract] Goal
> What done looks like.

## Context

Why this exists, who it is for.

## Milestones

- [ ] Milestone one
- [ ] Milestone two

## Open questions

- Question

## Log

- YYYY-MM-DD: what happened

## Related

- [[People or Notes]]
```

## Daily note

Filename: `YYYY-MM-DD.md`.

```md
---
tags:
  - daily
date: YYYY-MM-DD
---

## Plan

- [ ] Task

## Notes

## Done

- Thing
```

## Literature note

Filename: `Author Year Short Title.md`.

```md
---
tags:
  - literature
author: Author Name
year: 2026
url: https://example.com
status: read
---

> [!abstract] Summary
> Two or three sentences in your own words.

## Key points

- Point ^kp-1

## Quotes

> Short quote, kept brief and attributed.

## My take

What it changes about my thinking.

## Related

- [[Concept Note]]
```

## MOC (index)

Filename: `<Topic> MOC.md`.

```md
---
tags:
  - moc
---

One line on what this map covers.

## Core notes

- [[Note One]]: one-line description
- [[Note Two]]: one-line description

## Reading and references

- [[Literature Note]]

## Open questions

- Question
```
