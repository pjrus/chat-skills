#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
DIST_DIR="$SCRIPT_DIR/dist"

mkdir -p "$DIST_DIR"

package_skill() {
  local skill_name="$1"
  local skill_path="$SKILLS_DIR/$skill_name"
  local output_zip="$DIST_DIR/$skill_name.zip"

  if [ ! -d "$skill_path" ]; then
    echo "Error: Skill '$skill_name' not found in $SKILLS_DIR" >&2
    return 1
  fi

  if [ ! -f "$skill_path/SKILL.md" ]; then
    echo "Warning: Skill '$skill_name' does not contain SKILL.md" >&2
  fi

  echo "Packaging '$skill_name' -> dist/$skill_name.zip..."
  rm -f "$output_zip"

  # Zip contents directly from within the skill directory so SKILL.md is at root
  (
    cd "$skill_path"
    zip -q -r "$output_zip" . -x "*.DS_Store"
  )
}

if [ "$#" -eq 0 ]; then
  echo "Packaging all skills into $DIST_DIR/ ..."
  for skill_dir in "$SKILLS_DIR"/*; do
    if [ -d "$skill_dir" ]; then
      skill_name="$(basename "$skill_dir")"
      package_skill "$skill_name"
    fi
  done
  echo "Done! Packaged skills available in dist/"
else
  for skill_name in "$@"; do
    package_skill "$skill_name"
  done
  echo "Done!"
fi
