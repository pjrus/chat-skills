# Bases and Canvas

Contents: Bases (.base), Canvas (.canvas).

## Bases (.base)

A `.base` file is valid YAML that defines filters, formulas, and views over notes. It can also be embedded in a note with `![[file.base]]` or a fenced `base` code block.

### Schema

```yaml
filters:                 # global, applies to every view
  and:
    - file.hasTag("task")
    - 'file.ext == "md"'

formulas:
  days_until_due: 'if(due, (date(due) - today()).days, "")'
  is_overdue: 'if(due, date(due) < today() && status != "done", false)'

properties:
  status:
    displayName: "Status"
  formula.days_until_due:
    displayName: "Days left"

views:
  - type: table          # table | cards | list | map
    name: "Active tasks"
    limit: 50
    filters:             # view-specific
      and:
        - 'status != "done"'
    groupBy:
      property: status
      direction: ASC
    order:
      - file.name
      - status
      - due
      - formula.days_until_due
```

### Rules

- Filters are a single string or one recursive object with exactly one key: `and`, `or`, or `not`, each holding a list.
- Three kinds of property:
  - Note properties from frontmatter: `status` or `note.status`.
  - File properties: `file.name`, `file.mtime`, `file.ctime`, `file.ext`, `file.size`, `file.folder`, `file.path`, `file.tags`, `file.links`.
  - Formula properties: `formula.name`, which must be defined under `formulas`.
- Useful filter functions: `file.hasTag("a")` (also matches nested `a/b`), `file.hasLink("Note")`, `file.inFolder("Folder")`.
- `this` refers to the base file when opened directly, to the embedding note when embedded.
- Quote any string that contains `:`, quotes, or other YAML-special characters. Wrap formula expressions in single quotes and use double quotes inside.
- Every `formula.X` referenced in `order` or `properties` must exist in `formulas`.
- Validate that the file parses as YAML before delivering.

## Canvas (.canvas)

A canvas is JSON Canvas 1.0: an object with optional `nodes` and `edges` arrays. Nodes later in the array sit on top.

```json
{
  "nodes": [
    {
      "id": "a1b2c3d4e5f60718",
      "type": "text",
      "x": 0, "y": 0, "width": 300, "height": 120,
      "text": "## Main idea\n\nSupports **Markdown**.",
      "color": "4"
    },
    {
      "id": "b2c3d4e5f6071829",
      "type": "file",
      "x": 400, "y": 0, "width": 400, "height": 300,
      "file": "Notes/Binary Search Trees.md",
      "subpath": "#Definition"
    },
    {
      "id": "c3d4e5f607182930",
      "type": "link",
      "x": 0, "y": 200, "width": 300, "height": 150,
      "url": "https://obsidian.md"
    },
    {
      "id": "d4e5f60718293041",
      "type": "group",
      "x": -50, "y": -50, "width": 900, "height": 450,
      "label": "Cluster"
    }
  ],
  "edges": [
    {
      "id": "e5f6071829304152",
      "fromNode": "a1b2c3d4e5f60718",
      "fromSide": "right",
      "toNode": "b2c3d4e5f6071829",
      "toSide": "left",
      "toEnd": "arrow",
      "label": "see"
    }
  ]
}
```

### Rules

- Node required fields: `id`, `type` (`text`, `file`, `link`, `group`), `x`, `y`, `width`, `height` (integers). Plus `text` for text nodes, `file` for file nodes (optional `subpath` starting with `#`), `url` for link nodes. Groups may have `label`.
- Edge required fields: `id`, `fromNode`, `toNode`. Optional: `fromSide`/`toSide` (`top`, `right`, `bottom`, `left`), `fromEnd`/`toEnd` (`none` or `arrow`, `toEnd` defaults to `arrow`), `color`, `label`.
- `color` is a preset string `"1"` to `"6"` (red, orange, yellow, green, cyan, purple) or a hex colour such as `"#ff0000"`.
- IDs must be unique across nodes and edges. Use 16-character lowercase hex strings.
- Every `fromNode` and `toNode` must match an existing node `id`.
- Leave 40 to 80 pixels between nodes. Typical sizes: small text 200x80, medium 300x150, large 400x300, file preview 400x300.
- Escape newlines in `text` as `\n`.
- Validate that the file parses as JSON before delivering.
