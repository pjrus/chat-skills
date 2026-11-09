---
name: cover-letter-tailor
description: Draft, tailor, rewrite, and polish authentic, high-impact cover letters mapped directly to a candidate's background and a specific job posting. Produces concise single-page letters (3-4 paragraphs maximum) free from generic AI fluff, corporate jargon, and clichéd openings. Use whenever the user asks for a cover letter, application letter, motivation letter, job pitch, role-specific introduction, or asks to tailor their resume/background to a job description or company, even if they never say "cover letter".
---

# Cover Letter Tailor

A skill for crafting compelling, authentic, and high-signal cover letters that connect a candidate's proven track record directly to an employer's immediate needs.

---

## Core Principles

1. **Zero Fluff & Anti-AI Tone**
   - Strictly avoid generic corporate filler, buzzwords, and robotic AI openers.
   - Never use banned clichés:
     - *"I am writing to enthusiastically apply for..."*
     - *"I am thrilled/excited to submit my application..."*
     - *"I believe my unique blend of skills makes me the ideal candidate..."*
     - *"In today's fast-paced, dynamic environment..."*
     - Words like *synergy*, *passionate visionary*, *go-getter*, *deeply aligned*.
   - Sound human, grounded, direct, and confident.

2. **Strict Single-Page Length (Under 350-400 words)**
   - Hiring managers and recruiters spend 30 seconds reading a cover letter.
   - Enforce a 3-paragraph (or maximum 4-paragraph) architecture that fits effortlessly onto a single page with standard business letter margins.

3. **No Hallucinations or Invented Facts**
   - Only reference accomplishments, technologies, metrics, and roles present in the candidate's provided materials (resume, notes, or pasted summary).
   - If an essential detail is missing to support a specific job requirement, insert a clear, editable bracketed placeholder (e.g. `[managed team of X engineers]`, `[reduced latency by X%]`) and note it briefly in the output summary.

4. **Style Defaults**
   - Australian/Commonwealth English spelling (e.g., *prioritise*, *analysed*, *programmes*), unless the user or target company is explicitly US-based.
   - Plain words, active verbs, and no em dashes.

---

## 3-Paragraph Architecture

A winning cover letter follows a tight, logical narrative: **Hook -> Proof -> Fit & Close**.

### 1. Header & Greeting
- Clean business header: Candidate Name, Contact Info (Email, Phone, LinkedIn/Portfolio), Date, Hiring Manager / Company Name.
- Salutation: Address a specific person if known (e.g., *Dear Sarah,* or *Dear Mr Henderson,*). If unknown, use *Dear [Team Name] Hiring Team,* (e.g., *Dear Stripe Infrastructure Team,*). Never use *To Whom It May Concern*.
- Optional clear subject line: `Re: [Role Title] - [Candidate Name]`.

### 2. Paragraph 1: The Direct Hook (2-3 sentences)
- State the exact role applied for and immediately connect it to a recent public initiative, company engineering challenge, or core mission priority.
- Deliver the value thesis upfront: 1 or 2 core strengths the candidate brings to solve that specific problem right away.
- Example:
  > *"Watching Canva scale its collaborative editing engine to 150 million monthly active users has been remarkable. As a backend engineer who has spent the last four years building distributed message streaming architectures at scale, I would love to bring that hands-on systems experience to your Core Infrastructure team."*

### 3. Paragraph 2: The Strongest Proof Point (3-4 sentences)
- Anchor directly onto the primary requirement in the job description.
- Use a concrete story with measurable business or technical outcomes (Action -> Context -> Metric / Result).
- Show, do not tell: Avoid saying "I am a skilled communicator"; instead, show how cross-functional alignment unblocked a critical release.

### 4. Paragraph 3: Secondary Proof & Organisational Alignment (3-4 sentences)
- Connect a secondary technical skill, leadership trait, or domain experience to the team's day-to-day workflow.
- Demonstrate genuine knowledge of the company's product, engineering philosophy, or culture. Explain specifically why *this* team is the logical next step.

### 5. Paragraph 4: Decisive Sign-off (1-2 sentences)
- Direct, polite, and forward-looking.
- Reiterate availability for an interview or conversation.
- Never plead or use weak hedges (*"I hope you find my application suitable"*).
- Sign-off: *Sincerely,* or *Warm regards,* followed by the candidate's name.

---

## Workflow & Input Handling

When the user provides inputs:

1. **Analyze Both Sides**:
   - Extract the top 2-3 essential problems the job description requires solving.
   - Identify the candidate's top 1-2 accomplishments that directly solve those problems.
2. **Draft the Full Letter**:
   - Write out the complete letter in clean Markdown.
   - If the user uses LaTeX or requests Overleaf compatibility, output in clean LaTeX matching standard letter templates.
3. **Follow-up Summary**:
   - Provide a 2-sentence note highlighting:
     - Which key job requirements were targeted.
     - Any bracketed placeholders that need personal verification before sending.
