# chat-skills

A curated collection of modular, production-ready AI chat skills to enhance your workflow across ChatGPT, Claude, Antigravity, and other LLM assistants.

Each skill is formatted according to the standard `SKILL.md` specification and can be loaded directly as context, imported into projects, or zipped for direct upload into chat environments.

---

## Included Skills

| Skill | Description | Triggers / Use Cases |
| :--- | :--- | :--- |
| [`anki-flashcard`](skills/anki-flashcard/) | Generates Anki-ready flashcards with MathJax support for direct paste into Anki 2.1+. | "make a flashcard", "turn this into an Anki card", study/memorization tasks |
| [`email-rewrite`](skills/email-rewrite/) | Rewrites, tightens, softens, or restructures email drafts with minimal friction. | "rewrite this email", "make it more professional", "firmer / softer tone" |
| [`linkedin-post`](skills/linkedin-post/) | Drafts authentic, high-impact LinkedIn posts without generic corporate fluff. | "write a linkedin post", project updates, tech insights |
| [`linkedin-reply`](skills/linkedin-reply/) | Crafts high-engagement, thoughtful replies and comments for LinkedIn threads. | "reply to this post", "linkedin reply", comment drafting |
| [`obsidian-markdown`](skills/obsidian-markdown/) | Produces Obsidian Flavored Markdown (OFM) with YAML properties, `[[wikilinks]]`, callouts, canvas, and LaTeX math. | Notes, summaries, lecture notes, cheat sheets, `.canvas` or `.base` workflows |
| [`prompt-rewrite`](skills/prompt-rewrite/) | Refines, optimizes, and strengthens prompts for maximum execution quality while strictly preserving intent. | "improve this prompt", "optimize prompt", "make this prompt better" |
| [`resume-latex`](skills/resume-latex/) | Builds clean, ATS-friendly resumes and CVs using Jake's Resume LaTeX template. | "make a resume", "convert to LaTeX CV", Overleaf / LaTeX resume building |
| [`rw`](skills/rw/) | Seamless, zero-preamble text rewriting and sentence completion (Australian English, no em dashes). | `/rw`, "rewrite this", "finish this sentence", cut-off text completion |
| [`worksheet-latex`](skills/worksheet-latex/) | Generates publication-ready academic worksheets, quizzes, exams, and problem sets with working space and answer key toggles. | "make a worksheet", "create a quiz / exam", math / science problem sets, LaTeX handout |

---

## Getting Started

### 1. Package Skills for Upload

Many chat interfaces (like ChatGPT Skills or Claude Projects) allow you to upload skills as `.zip` archives containing `SKILL.md` at the root.

To package all skills into ready-to-upload zip files:

```bash
./package.sh
```

The archives will be generated in `dist/`:

```
dist/
├── anki-flashcard.zip
├── email-rewrite.zip
├── linkedin-post.zip
├── linkedin-reply.zip
├── obsidian-markdown.zip
├── prompt-rewrite.zip
├── resume-latex.zip
├── rw.zip
└── worksheet-latex.zip
```

To package a single skill:

```bash
./package.sh obsidian-markdown
```

### 2. Using with AI Assistants

- **ChatGPT / Claude Projects:** Upload the corresponding `.zip` file from `dist/` or paste the contents of `SKILL.md` into project instructions.
- **Antigravity / Cursor / Custom Agents:** Copy the skill folder directly into your workspace or skills directory (e.g. `~/.gemini/antigravity/skills/<skill-name>`).

---

## Repository Structure

```text
chat-skills/
├── skills/
│   ├── anki-flashcard/
│   │   └── SKILL.md
│   ├── email-rewrite/
│   │   └── SKILL.md
│   ├── linkedin-post/
│   │   └── SKILL.md
│   ├── linkedin-reply/
│   │   └── SKILL.md
│   ├── obsidian-markdown/
│   │   ├── SKILL.md
│   │   └── references/
│   ├── prompt-rewrite/
│   │   └── SKILL.md
│   ├── resume-latex/
│   │   └── SKILL.md
│   ├── rw/
│   │   └── SKILL.md
│   └── worksheet-latex/
│       └── SKILL.md
├── package.sh
├── .gitignore
├── LICENSE
└── README.md
```

---

## License

[MIT](LICENSE)
