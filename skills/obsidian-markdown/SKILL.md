---
name: obsidian-markdown
description: Write notes as Obsidian Flavored Markdown (.md files) with YAML properties, [[wikilinks]], callouts, embeds, tags and LaTeX maths. Obsidian MD is the default flavour for ANY note-taking or markdown request. Use this skill whenever the user asks for notes, study notes, summaries to keep, meeting notes, a note, a vault, a zettel, a MOC, a daily note, a cheat sheet, a lecture summary, or a markdown or .md file, even if they never say "Obsidian". Also use it for Obsidian Bases (.base) and Canvas (.canvas) files, and when converting text into notes. If the user names another format (Word, PDF, slides, Google Docs), that format wins.
---

# Obsidian Markdown

Obsidian is the default note format. When the user wants notes or a markdown file, write Obsidian Flavored Markdown (OFM) and deliver real `.md` files that drop straight into a vault. Do not paste a long note into chat and call it done.

OFM = CommonMark + GitHub Flavored Markdown + LaTeX, plus Obsidian extensions (wikilinks, embeds, callouts, block IDs, comments, highlights, properties). Obsidian does not render Markdown inside HTML tags, so avoid HTML except `<details>`, `<kbd>`, `<br>`.

## Defaults

- **Format**: `.md` file(s), OFM. One idea per note when the content has several distinct topics (atomic notes), otherwise one note.
- **Delivery**: create the file(s), then share them. In Claude.ai write to `/mnt/user-data/outputs/` and call `present_files`. In Claude Code or Cowork, write into the vault path the user gave (ask once if none is known). Short answers or quick explanations can stay in chat.
- **Overrides**: if the user asks for portable or "plain" Markdown, switch wikilinks to standard links and skip callouts, block IDs, `%%comments%%` and `==highlights==`. If they ask for another file format, use that format's skill instead.
- **Style**: follow the user's own language, spelling and tone preferences. Write maths in LaTeX (`$...$`, `$$...$$`).

## Workflow

1. Decide the note set: one note, or several atomic notes plus an index (MOC) when there are 3 or more.
2. Name each file (see Filenames).
3. Write the properties block (see Properties).
4. Write the body: headings from `##` down, short paragraphs, lists, tables, callouts where they help.
5. Link: `[[wikilinks]]` between the notes you create and to obvious related concepts. Only link to notes that exist in this set or are sensible stubs; never invent links to notes the user hasn't got just to look connected.
6. Run the checklist at the bottom, then deliver.

## Filenames

The filename is the note title and the link target, so make it human-readable.

- Use plain words, spaces allowed: `Binary Search Trees.md`, `2026-11-08 Team Sync.md`.
- Never use these characters: `# ^ [ ] | \ / : ? * " < >`. The first five break wikilinks; the rest break on Windows, Android or Sync.
- Keep names unique across the set, since `[[Name]]` resolves by name.
- Date-led names use `YYYY-MM-DD` so they sort.
- Do not add the note title as an H1 when it duplicates the filename. Start body headings at `##`. If the user shows a vault convention (H1 titles, kebab-case names), copy it.

## Properties (YAML frontmatter)

Put at the very top, between `---` lines.

```yaml
---
tags:
  - topic/subtopic
aliases:
  - Alternate name
created: 2026-11-08
status: draft
related:
  - "[[Other Note]]"
---
```

Rules:

- Defaults are `tags`, `aliases`, `cssclasses`, all plural lists. Singular `tag`, `alias`, `cssclass` are deprecated and no longer work as defaults.
- Tags in properties have **no `#`** and are always a list.
- Each key appears once per note. No nested properties; keep values flat.
- Types: text, list, number (literal, no operators), checkbox (`true`/`false`), date `YYYY-MM-DD`, date and time `YYYY-MM-DDTHH:mm:ss`.
- Links in properties must be quoted: `"[[Note]]"`, and inside lists too.
- Text properties do not render Markdown and `#hashtags` there do not become tags.
- Quote any string containing `:` or other YAML-special characters.

Add only properties that earn their place. `tags`, `created`, and a `status` or `type` usually suffice.

## Core syntax

Full reference with edge cases: `references/syntax.md`. Read it when writing tables with links, embeds with sizing, footnotes, or Mermaid.

| Need | Syntax |
|---|---|
| Internal link | `[[Note]]`, `[[Note\|Shown text]]`, `[[Note#Heading]]`, `[[#Heading]]` |
| Block link | `[[Note#^block-id]]` |
| Define block ID | put `^block-id` at the end of a paragraph or list item (letters, digits, hyphens) |
| Embed note or section | `![[Note]]`, `![[Note#Heading]]`, `![[Note#^block-id]]` |
| Embed image, sized | `![[image.png]]`, `![[image.png\|400]]`, `![[image.png\|400x300]]` |
| Embed PDF page | `![[file.pdf#page=3]]` |
| Callout | `> [!tip] Title` then `> body` lines |
| Foldable callout | `> [!faq]- Collapsed` or `> [!faq]+ Expanded` |
| Highlight | `==text==` |
| Comment (hidden) | `%%text%%` |
| Inline tag | `#project/alpha` |
| Task | `- [ ] todo`, `- [x] done` |
| Footnote | `text[^1]` with `[^1]: note`, or inline `^[note]` |
| Inline maths | `$e^{i\pi}+1=0$` |
| Block maths | `$$ ... $$` on their own lines |
| Mermaid | fenced block with language `mermaid` |

Use `[[wikilinks]]` for anything inside the vault and `[text](https://...)` only for external URLs.

### Callout types

`note`, `abstract` (summary, tldr), `info`, `todo`, `tip` (hint, important), `success` (check, done), `question` (help, faq), `warning` (caution, attention), `failure` (fail, missing), `danger` (error), `bug`, `example`, `quote` (cite). Unknown types fall back to `note`. Type names are case-insensitive. Callouts nest with extra `>`.

Use callouts sparingly: definitions as `[!note]`, warnings as `[!warning]`, worked examples as `[!example]`, spoilers or answers as collapsed `[!question]-`.

### Tags

Allowed: letters, numbers, `_`, `-`, `/` (nesting), emojis. Not allowed: spaces. Must contain at least one non-digit (`#1984` is invalid, `#y1984` is fine). Case-insensitive. Prefer a small, consistent hierarchy such as `course/FIT3181`, `status/active`.

### Tables

Pipes inside wikilinks must be escaped in tables: `[[Note\|Alias]]`.

## Multiple notes

When producing several notes:

- Create a folder named after the topic, containing the notes.
- Add an index note (MOC) named `<Topic> MOC.md` that links to every note with a one-line description.
- Link notes to each other with exact filename matches. Add a `## Related` section at the bottom of each note where genuinely useful.
- Present every file. If there are more than 5, also provide a `.zip` of the folder.

## Other Obsidian file types

- **Bases** (`.base`, YAML database-style views of notes) and **Canvas** (`.canvas`, JSON Canvas whiteboards): read `references/bases-and-canvas.md` before writing either.
- **Templates for common note types** (meeting, study or concept note, project, daily, literature, MOC): read `references/templates.md` when the user asks for one of these or the request clearly fits.

## Pre-delivery checklist

- Frontmatter is valid YAML, tags are a list without `#`, property links are quoted.
- Filename has none of the forbidden characters and is unique.
- Every `[[link]]` points to a note in the set, a stub the user will expect, or a deliberate future note.
- Pipes in tables are escaped inside wikilinks.
- No Markdown inside HTML tags.
- Code fences have a language; maths uses `$`/`$$`, not plain text.
- Callout syntax has `> ` on every line, and the type is valid.
- File is saved as `.md` (or `.base` / `.canvas`) and presented to the user.
