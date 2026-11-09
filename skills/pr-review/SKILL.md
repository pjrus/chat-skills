---
name: pr-review
description: Conduct rigorous, pragmatic, and high-signal code reviews on pull requests, git diffs, or code snippets. Prioritises correctness, security, race conditions, breaking changes, and performance regressions over stylistic nitpicking or linter policing. Use whenever the user asks for a PR review, code review, diff critique, asks "review this code", "spot any bugs in this PR", or pastes a git diff or code block asking for feedback.
---

# PR Review

Conduct thorough, actionable, and pragmatic engineering code reviews that catch real bugs, prevent regressions, and uphold architectural health without bikeshedding.

---

## Core Principles

1. **Focus on High-Impact Concerns (No Linter Nitpicks)**
   - Do not waste time on formatting, whitespace, import ordering, or trivial syntax that automated tools (Prettier, ESLint, Ruff, rustfmt) handle.
   - Focus your review on:
     - **Correctness & Logic:** Edge cases, null/undefined handling, off-by-one errors, integer overflow, unhandled errors.
     - **Concurrency & State:** Race conditions, thread safety, stale state, memory leaks, unclosed streams/connections.
     - **Security:** Injection vectors (SQL, command, XSS), unvalidated user inputs, auth/authz bypasses, secret leaks.
     - **Performance & Scale:** N+1 queries, unindexed lookups, excessive allocations in hot loops, unbounded memory growth.
     - **Backwards Compatibility:** Breaking API contracts, database schema migration safety, serialization drift.
     - **Test Quality:** Are the critical failure modes and edge cases tested, or only happy paths?

2. **Categorised Severity Labels**
   - Every piece of feedback must start with a distinct severity tag:
     - `[BLOCKER]`: Critical defect, security flaw, data corruption risk, or broken contract. Must be resolved before merge.
     - `[WARNING]`: Significant edge-case omission, missing error handling, or performance regression. Strongly recommended to fix.
     - `[SUGGESTION]`: Idiomatic improvement or clean refactoring idea. Explicitly non-blocking.
     - `[QUESTION]`: Inquiring about design rationale, domain constraints, or unseen requirements.

3. **Provide Concrete Drop-in Fixes**
   - Never leave vague feedback like *"Consider refactoring this function to be more robust"*.
   - Always demonstrate the exact alternative with a minimal before/after code snippet or replacement block.

4. **Tone & Style**
   - Professional, direct, and collaborative. Assume competence and focus on the code, not the author.
   - Australian/Commonwealth English defaults (*prioritise*, *behaviour*), no em dashes.

---

## Standard Review Format

Deliver reviews in the following scannable structure:

```markdown
### Summary & Verdict
**Verdict:** [APPROVE / REQUEST CHANGES / COMMENT]  
[1-2 sentences summarizing the overall quality, scope, and primary concern or highlight of the change.]

---

### Critical Issues & Deficiencies
<!-- If none, explicitly state "None identified." -->

#### `[BLOCKER]` [Short descriptive title]
- **Location:** `path/to/file.ext:line` (or function name)
- **Problem:** [Explain clearly why this is a bug, security vulnerability, or breaking change.]
- **Suggested Fix:**
```language
// Concise drop-in replacement snippet
```

#### `[WARNING]` [Short descriptive title]
- **Location:** `path/to/file.ext:line`
- **Problem:** [Describe the edge case, unhandled error, or performance concern.]
- **Suggested Fix:**
```language
// Concise drop-in replacement snippet
```

---

### Suggestions & Non-Blocking Improvements
<!-- Use [SUGGESTION] or [QUESTION] tags -->
- **`[SUGGESTION]` [`path/to/file.ext:line`]:** [Description of idiomatic cleanup or simplification.]
- **`[QUESTION]` [`path/to/file.ext:line`]:** [Question regarding intent, edge cases, or future considerations.]

---

### Positive Highlights
- [1-2 brief bullet points acknowledging clever solutions, clean abstractions, or thorough test coverage.]
```

---

## Review Checklist for Common Languages

- **TypeScript / JavaScript:** Strict null/undefined checks, unhandled promise rejections, async error propagation, memory retention in event listeners.
- **Python:** Mutable default arguments, unclosed context managers, exception swallowing (`except Exception: pass`), type hint fidelity.
- **Go:** Goroutine leaks, unhandled errors, mutex contention, defer execution order in loops, slice capacity pitfalls.
- **Rust:** Unnecessary clones in hot paths, improper `unwrap()`/`expect()` in library code, borrow checker workarounds that compromise clarity.
- **SQL / Database:** Missing migration rollback scripts, non-concurrent index creation on high-traffic tables, unbounded queries without `LIMIT`.
