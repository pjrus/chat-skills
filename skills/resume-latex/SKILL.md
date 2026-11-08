---
name: resume-latex
description: Build resumes and CVs as PDFs and compilable LaTeX code (.tex), using Jake's Resume template by default. Supports 1-page default formatting, up to 2 pages maximum when needed, and direct text or document conversion into clean LaTeX markup and downloadable outputs. Use whenever the user wants to make, rewrite, tailor, reformat or update a resume or CV, turn resume content (pasted text, an old PDF or docx, a LinkedIn dump) into a polished resume, or mentions LaTeX, Overleaf, ATS-friendly resumes, "Jake's resume", or resumes, even if they do not say "LaTeX".
---

# Resume LaTeX Builder

A skill for generating, rewriting, tailoring, and converting resumes into clean, ATS-friendly LaTeX code based on Jake's Resume template, delivering both .tex and PDF outputs.

## Core Rules & Page Constraints

1. **Default Target: Exactly 1 Page**
   - Resumes must target a single page by default.
   - Use concise bullet points, tight spacing (`\vspace`), and clean typography to keep the layout strictly within 1 page without overcrowding.

2. **2-Page Maximum Allowance**
   - For users with extensive work history, research publications, or detailed technical projects, a 2-page resume is permitted (strict maximum of 2 pages).
   - Ensure page 2 fills at least half the page so the document looks balanced. Never produce trailing awkward overflow pages.

3. **Deliverables: Both .tex and PDF Outputs**
   - Always provide the complete, compilable `.tex` source code in a single self-contained code block.
   - Simultaneously generate and offer the compiled downloadable PDF document so the user has immediate access to both formats.
   - Ensure markup compiles smoothly on standard TeX Live / Overleaf distributions with all special characters (`%`, `&`, `$`, `#`, `_`) properly escaped.

---

## Content Conversion Section

When a user provides unstructured input (pasted text, markdown, bullet dumps, LinkedIn exports, or excerpts from an old resume):

1. **Information Extraction & Normalisation**
   - Parse and categorise the provided details into standard resume sections: Contact Header, Education, Experience, Projects, Technical Skills, and Leadership/Extracurriculars.
   - Standardise dates to a consistent format (e.g. `MMM YYYY -- Present` or `YYYY -- YYYY`).
   - Clean up informal phrasing and convert run-on sentences into high-impact, action-oriented bullet points using the Google XYZ formula (`Accomplished [X] as measured by [Y], by doing [Z]`).

2. **Length Assessment & Routing**
   - **Default (1 Page):** Curate and prioritise the top 3 to 4 most relevant roles and 2 to 3 key projects. Trim older, redundant, or lower-impact points to ensure an exact single-page fit.
   - **Extended (Up to 2 Pages):** If the user explicitly asks for a comprehensive CV or has extensive relevant experience that justifies 2 full pages, expand project descriptions, technical details, and responsibilities, ensuring content cleanly fills the 2-page boundary.

3. **Output Execution**
   - Deliver the full, unclipped `.tex` markup.
   - Provide the accompanying PDF output.
   - Briefly outline the key structural edits, omissions, and adjustments made during conversion.
