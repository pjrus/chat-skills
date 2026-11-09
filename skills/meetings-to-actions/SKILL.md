---
name: meetings-to-actions
description: Transform raw meeting transcripts, audio dumps, scratchpad notes, chat logs, or messy brain dumps into clear, structured meeting records. Extracts high-level executive takeaways, explicit decisions made, thematic discussion points, and a concrete action item matrix with dedicated owners and deadlines. Use whenever the user pastes meeting notes, transcripts (Otter.ai, Zoom, Teams, Google Meet), 1-on-1 notes, sync notes, standups, sprint retros, or asks for "meeting minutes", "action items", "decisions made", "summarise this meeting", or "turn this transcript into tasks".
---

# Meetings to Actions

Transform chaotic meeting transcripts and raw meeting notes into concise, actionable, and executive-ready records.

---

## Core Rules & Principles

1. **High Signal, Zero Chronological Fluff**
   - Never provide a chronological play-by-play (e.g., *"First Alice joined and greeted Bob, then Bob shared his screen..."*).
   - Cut out all small talk, scheduling logistics, tangent discussions, audio checks, and filler chatter.
   - Organise content by strategic theme or project domain, not time elapsed.

2. **Ruthless Decision Extraction**
   - Explicitly separate **Decisions Made** from general discussion.
   - Capture what was agreed upon, what was rejected, and what was intentionally deferred/punted (and why).

3. **Strict Action Item Attribution**
   - Every action item must start with an imperative action verb (*"Draft...", "Benchmark...", "Schedule..."*).
   - Assign every action to a specific individual. Never assign to a vague group like *"The team"* or *"Engineers"*.
   - If an item was left unassigned in the transcript, label it explicitly as `[Unassigned - Needs Owner]`.
   - Extract concrete deadlines or relative timing (e.g. *"by Friday COB"*, *"Sprint 42"*). If no timeline was specified, label it as `[TBD]`.

4. **Style Defaults**
   - Commonwealth / Australian English (e.g., *prioritise*, *organised*, *programmes*).
   - Clear markdown formatting, bold lead-ins, and no em dashes.

---

## Standard Output Structure

Deliver every processed meeting in this consistent, scannable format:

```markdown
# [Meeting Title / Topic]

**Date:** [YYYY-MM-DD or Given Date]  
**Attendees:** [List of participants, or "Unspecified"]  
**Context / Goal:** [1 sentence outlining the core purpose of the meeting]

---

### Executive Summary
[2-3 sentences capturing the primary outcome, major consensus, or most critical update from the meeting.]

---

### Key Decisions Made
- **[Decision 1 Name]:** [What was agreed upon and the underlying rationale/trade-off.]
- **[Decision 2 Name]:** [What was agreed upon.]
- **[Deferred / Punted]:** [Any decision intentionally tabled for future discussion and the prerequisite needed.]

---

### Discussion Highlights
#### 1. [Theme / Agenda Topic A]
- **[Key Point]:** [Context, insight, or data point shared.]
- **[Trade-off / Concern]:** [Notable friction, counter-argument, or constraint raised.]

#### 2. [Theme / Agenda Topic B]
- **[Key Point]:** [Context, insight, or data point shared.]

---

### Action Items

| # | Task / Action Item | Owner | Target Date | Status / Notes |
|---|---|---|---|---|
| 1 | [Action verb + clear deliverable] | [Name] | [YYYY-MM-DD or Relative] | [e.g. Blocker, dependency, or link] |
| 2 | [Action verb + clear deliverable] | [Unassigned - Needs Owner] | [TBD] | [Needs volunteer] |

---

### Open Questions & Blockers
- [Unresolved question or blocker requiring escalation or external input]
```

---

## Workflow & Special Situations

1. **Messy or Incomplete Transcripts**
   - If speech-to-text misspellings or phonetic errors occur (e.g., tech stacks or employee names like *"coober netties"* or *"sequel"*), normalise them to proper terminology (`Kubernetes`, `SQL`).
   - Where a speaker's meaning is ambiguous due to broken transcription, present the most logical interpretation and flag it with `[Verify: speaker intended X]`.

2. **1-on-1 Catch-ups**
   - When processing a 1-on-1, pivot the highlights toward career progress, personal feedback, roadblocks, and two-way commitments.

3. **Sprint Retrospectives**
   - Categorise discussion highlights into: *What Went Well*, *What Stalled / Needs Improvement*, and *Process Experiments*.
