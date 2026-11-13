---
name: bug-report
description: Structure messy error logs, stack traces, user complaints, or incident threads into crisp, reproducible bug reports, root-cause analyses, and blameless postmortems. Use whenever the user asks to write a bug report, file an issue/ticket, triage an error, diagnose a stack trace, or draft an incident postmortem.
---

# Bug Report & Postmortem

Turn fragmented logs, stack traces, Slack threads, and symptoms into actionable, reproducible bug tickets or blameless incident postmortems.

---

## Core Principles

1. **Reproducibility First**
   - A bug report without reproduction steps is a guess. Distil the **minimal reproducible example (MRE)**: exact inputs, preconditions, commands, or API payloads needed to trigger the failure.
   - Always contrast **Observed Behaviour** against **Expected Behaviour**.

2. **Signal Over Log Spam**
   - Trim noisy stack traces and boilerplate logs down to the failing frame, error code, status, and relevant context.
   - Redact secrets, tokens, API keys, and PII if present in pasted logs.

3. **Separate Facts from Hypotheses**
   - Never fabricate a root cause. If the underlying cause cannot be confirmed from the provided evidence, explicitly label candidate causes as **Hypotheses** and list the diagnostic checks needed to confirm or rule them out.

4. **Severity & Blast Radius**
   - Classify impact clearly using standard severity levels:
     - `SEV-1 (Critical)`: Production outage, data loss, or security breach with no workaround.
     - `SEV-2 (High)`: Major feature broken or severe degradation affecting many users; workaround may exist.
     - `SEV-3 (Medium)`: Non-critical defect or edge-case failure with limited blast radius.
     - `SEV-4 (Low)`: Minor UI glitch, typo, or cosmetic issue.

5. **Style Defaults**
   - Australian/Commonwealth English spelling (*behaviour*, *prioritise*, *minimise*, *organisation*).
   - Objective, blameless, and concise. Focus on systems and safeguards rather than individuals.
   - Clean Markdown formatting and no em dashes.

---

## Mode Selection

Choose the format that fits the user's input:
- **Bug Report / Issue Ticket** (default): When reporting a defect, triaging a stack trace, or filing a Jira/Linear/GitHub issue.
- **Incident Postmortem / RCA**: When an outage or production incident has occurred and the user needs a timeline, root-cause analysis, and follow-up actions.

---

## Template 1: Bug Report / Issue Ticket

```markdown
## [SEV-X] [Concise, specific title describing the failure]

**Component / Area:** [Service, module, or page]  
**Environment:** [OS, browser/runtime version, commit SHA, staging/prod]  
**Severity:** [SEV-1 / SEV-2 / SEV-3 / SEV-4]

### Summary
[1-2 sentences describing what is failing and who/what is affected.]

### Observed vs Expected Behaviour
- **Observed:** [Exact error, crash, or incorrect output.]
- **Expected:** [What should happen instead.]

### Steps to Reproduce
1. [Precondition or setup]
2. [Exact action, request, or command]
3. [Triggering step]

### Evidence & Logs
```text
[Trimmed stack trace, HTTP status/payload, or relevant log lines only]
```

### Root Cause / Hypotheses
- **Confirmed / Likely Cause:** [Explanation if clear from evidence, or "Unconfirmed; see hypotheses below."]
- **Diagnostic Next Steps:** [Specific log, query, or test to isolate the defect]
```

---

## Template 2: Blameless Postmortem / RCA

```markdown
# Postmortem: [Incident Title]

**Date:** [YYYY-MM-DD]  
**Severity:** [SEV-X]  
**Duration:** [Start time to resolution, e.g. 42 minutes]  
**Impact:** [Affected users, requests failed, or degraded capabilities]

### Executive Summary
[2-3 sentences covering what broke, why it happened, and how it was mitigated.]

### Timeline (UTC / Local)
- **HH:MM:** [Triggering event or deploy]
- **HH:MM:** [Alert fired / issue detected]
- **HH:MM:** [Mitigation applied]
- **HH:MM:** [Full recovery confirmed]

### Root Cause & Contributing Factors
- **Primary Root Cause:** [Technical mechanism that caused the failure]
- **Contributing Factors:** [Missing guardrails, alert gaps, config drift, etc.]

### What Went Well / What Could Be Improved
- **Went Well:** [Fast detection, clean rollback, etc.]
- **Gaps:** [Missing test case, unclear runbook, noisy alert]

### Corrective Action Items
| Action | Type | Priority | Owner |
| :--- | :--- | :--- | :--- |
| [Specific preventative fix] | Fix / Guardrail / Monitoring | P0 / P1 / P2 | [Team / Role] |
```
