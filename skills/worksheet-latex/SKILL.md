---
name: worksheet-latex
description: Create professional, beautiful, and compilable LaTeX worksheets, problem sets, quizzes, exams, and tutorial handouts with optional answer keys. Supports student name/date headers, point values, multiple choice, multi-part questions, designated working space, lined or boxed answer areas, formula cheat sheets, and teacher solution toggles. Use whenever the user asks for a worksheet, problem set, practice questions, quiz, test, exam, homework sheet, tutorial sheet, math/science drill, or student handout in LaTeX or PDF format, even if they don't explicitly say "LaTeX".
---

# LaTeX Worksheet Builder

Create publication-quality, pedagogical academic worksheets, homework assignments, problem sets, quizzes, and exams in clean, compilable LaTeX.

---

## Core Rules & Output Standards

1. **Compilable & Self-Contained Source Code**
   - Output complete, production-ready LaTeX documents in a single code block.
   - Use standard TeX Live and Overleaf compatible packages (`exam` document class, or `article` with `geometry`, `amsmath`, `amssymb`, `tcolorbox`, `tasks`, and `fancyhdr`).
   - Strictly escape all special characters (`%`, `&`, `$`, `#`, `_`, `^`, `~`) outside math mode.

2. **Student-Centric Layout & Spacing**
   - Include a clean, compact header at the top of page 1: **Name**, **Date**, **Class / Section**, and optional **Score / Points**.
   - Always allocate adequate physical space for student working out. Never produce cramped worksheets where students cannot write their calculations.
   - Use dedicated working mechanisms: `\vspace{...}`, lined answer rules (`\fillwithlines{...}`), or boxed response areas (`\makeemptybox{...}`).

3. **Dual-Mode Answer Key / Solution Support**
   - Build documents with an answer toggle so the same source code can generate either a **Student Worksheet** or a **Teacher Solution Key**.
   - When using the `exam` class, document the `\printanswers` switch at the top.
   - In solution mode, format answers clearly with bold callouts, step-by-step intermediate working, and point allocations.

---

## Architecture & Document Classes

Choose the appropriate architecture based on the user's intended format:

### Option A: The `exam` Class (Default for Tests, Quizzes & Graded Problem Sets)

The standard LaTeX `exam` class provides built-in grading tables, point counters, solution toggles, and flexible choice environments.

```latex
\documentclass[11pt,addpoints]{exam}
% Toggle solution key:
% \printanswers
```

**Key primitives:**
- `\begin{questions}` ... `\question[points]` ... `\end{questions}`
- Multi-part questions: `\begin{parts}` ... `\part[points]` ... `\end{parts}`
- Sub-parts: `\begin{subparts}` ... `\subpart` ... `\end{subparts}`
- Answer spaces: `\vspace{2.5cm}`, `\fillwithlines{3cm}`, `\fillwithdottedlines{2.5cm}`, `\makeemptybox{4cm}`
- Solutions: `\begin{solution}` ... `\end{solution}` or `\begin{solution}[3cm]`
- Multiple choice: `\begin{choices}` / `\begin{oneparchoices}` with `\choice` and `\CorrectChoice`

### Option B: The Modern `article` Class (Best for Tutorial Handouts & Drills)

Use when creating modern, highly styled homework packets, lecture companion sheets, or reference-heavy drill sheets with colourful callout boxes (`tcolorbox`).

```latex
\documentclass[11pt,a4paper]{article}
\usepackage[margin=0.75in]{geometry}
\usepackage{amsmath,amssymb}
\usepackage[most]{tcolorbox}
\usepackage{enumitem}
\usepackage{tasks}
```

---

## Pedagogical Structure & Flow

When generating a worksheet from scratch or transforming user materials:

1. **Title & Header Block**
   - Institution, course title, worksheet title, and subtitle (e.g. *Unit 3: Integration by Parts*).
   - Neat prompt fields: `Name: \underline{\hspace{5cm}} \quad Date: \underline{\hspace{3cm}} \quad Period: \underline{\hspace{2cm}}`.

2. **Instructions & Formula Reference**
   - Provide clear directions (e.g. time allowance, calculator policies, rounding instructions).
   - Include a concise, framed reference box (`tcolorbox` or `framed`) for formulas, constants, or vocabulary where helpful.

3. **Scaffolded Question Progression**
   - **Section A: Warm-up / Conceptual** (Vocabulary, multiple choice, true/false, direct recall).
   - **Section B: Core Practice / Procedural** (Standard problems, step-by-step arithmetic or algebraic derivations).
   - **Section C: Application & Extension** (Word problems, multi-step synthesis, open-ended challenge questions).

4. **Point Allocations**
   - Specify mark values for each question (e.g. `[2 marks]`, `[5 points]`).
   - Breakdown marks for sub-parts (`(a) [1 mark]`, `(b) [3 marks]`) to guide student time investment.

---

## Complete Starter Template (`exam` Class)

```latex
\documentclass[11pt,a4paper,addpoints]{exam}

\usepackage{amsmath,amssymb,amsfonts}
\usepackage{graphicx}
\usepackage{geometry}
\geometry{top=2cm,bottom=2.5cm,left=2cm,right=2cm}

% Toggle answers on/off:
% \printanswers

% Header and Footer Styling
\pagestyle{headandfoot}
\firstpageheader{\textbf{Course:} Mathematics HL}{\textbf{Worksheet:} Calculus Foundations}{\textbf{Term:} 1}
\runningheader{Calculus Foundations}{}{Page \thepage\ of \numpages}
\firstpagefooter{}{}{}
\runningfooter{}{Page \thepage\ of \numpages}{}
\runningheadrule
\firstpageheadrule

% Format point displays
\pointname{ pt}
\pointformat{[\bfseries\thepoints]}

% Format solution appearance
\shadedsolutions
\definecolor{SolutionColor}{rgb}{0.93,0.95,1.0}

\begin{document}

% Student Metadata Block
\noindent
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
  \textbf{Name:} \underline{\hspace{6.5cm}} & \textbf{Date:} \underline{\hspace{3.5cm}} \\
  \textbf{Class/Section:} \underline{\hspace{4.5cm}} & \textbf{Score:} \underline{\hspace{2cm}} / \numpoints\ pts
\end{tabular*}

\vspace{0.4cm}
\hrule
\vspace{0.4cm}

\noindent
\textbf{Instructions:} Answer all questions in the space provided. Show all working clearly. Unsupported answers may receive no credit. Calculators are permitted unless specified otherwise.

\vspace{0.3cm}

\begin{questions}

% Multiple Choice Section
\section*{Section 1: Conceptual Check}

\question[2]
Which of the following functions has a derivative equal to itself for all real values of $x$?
\begin{choices}
  \choice $f(x) = \ln(x)$
  \CorrectChoice $f(x) = e^x$
  \choice $f(x) = x^2$
  \choice $f(x) = \sin(x)$
\end{choices}

\question[2]
Evaluate the limit: $\lim_{x \to 0} \frac{\sin(3x)}{x}$.
\begin{oneparchoices}
  \choice $0$
  \choice $1$
  \CorrectChoice $3$
  \choice Does not exist
\end{oneparchoices}

% Multi-part Analytic Section
\section*{Section 2: Worked Problems}

\question
Consider the quadratic function $f(x) = 2x^2 - 8x + 6$.

\begin{parts}
  \part[2]
  Find the coordinates of the vertex of the parabola.
  \begin{solution}[3.5cm]
    Using the vertex formula $x_v = -\frac{b}{2a}$:
    \[
      x_v = -\frac{-8}{2(2)} = \frac{8}{4} = 2
    \]
    Substituting back into $f(x)$:
    \[
      f(2) = 2(2)^2 - 8(2) + 6 = 8 - 16 + 6 = -2
    \]
    The vertex is at $(2, -2)$.
  \end{solution}

  \part[3]
  Determine the roots of $f(x)$ by factoring or using the quadratic formula.
  \begin{solution}[4cm]
    Factoring out the common coefficient:
    \[
      2(x^2 - 4x + 3) = 0 \implies 2(x - 1)(x - 3) = 0
    \]
    Therefore, the roots are $x = 1$ and $x = 3$.
  \end{solution}
\end{parts}

% Long Answer / Derivation with Boxed Workspace
\question[4]
Evaluate the definite integral $\int_{0}^{2} (3x^2 - 4x + 1) \, dx$. Show all intermediate anti-derivatives.

\begin{solution}[5cm]
  Find the antiderivative:
  \[
    F(x) = \int (3x^2 - 4x + 1) \, dx = x^3 - 2x^2 + x
  \]
  Evaluate from $0$ to $2$:
  \[
    F(2) = (2)^3 - 2(2)^2 + 2 = 8 - 8 + 2 = 2
  \]
  \[
    F(0) = 0
  \]
  \[
    \int_{0}^{2} (3x^2 - 4x + 1) \, dx = 2 - 0 = \mathbf{2}
  \]
\end{solution}

\end{questions}

\end{document}
```

---

## Formatting Guidelines & Checklist

- **Adequate Spacing**: Double-check `\vspace` or box heights. A 3-mark integral question typically requires at least `4cm` to `5cm` of vertical working room.
- **Math Typography**: Use `\text{...}` inside math expressions for text, `\left(` and `\right)` for scalable brackets, and proper delimiters `\[...\]` for display formulas.
- **Units**: Format units consistently using regular Roman text with a small space (e.g. `$9.8\text{ m/s}^2$`) or the `siunitx` package (`\unit{m.s^{-2}}`).
- **Clean Grids / Graphs**: When a graph or coordinate plane is required for student sketching, generate a TikZ grid rather than leaving a blank gap.
