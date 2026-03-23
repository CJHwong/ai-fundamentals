#!/bin/bash
set -e
cd "$(dirname "$0")"

parts=(
  content/part1_1_core_mechanic.md
  content/part1_2_why_powerful.md
  content/part1_3_where_the_ceiling_is.md
  content/part2_1_what_agents_are.md
  content/part2_2_completing_the_picture.md
  content/part2_3_where_agents_are_today.md
  content/part3_1_context_engineering.md
  content/part3_2_parallelization.md
  content/part3_3_ai_at_gofreight.md
  content/part3_4_ai_in_your_role.md
  content/closing.md
  content/terminology.md
  content/final_quiz.md
)

combined="build/combined.md"
output="docs/index.html"
mkdir -p build docs

# 1. Concatenate markdown
rm -f "$combined"
for i in "${!parts[@]}"; do
  cat "${parts[$i]}" >> "$combined"
  if (( i < ${#parts[@]} - 1 )); then
    printf '\n\n---\n\n' >> "$combined"
  fi
done

# 2. Convert to HTML body using pandoc, then inject into template
pandoc "$combined" \
  -f markdown \
  -t html5 \
  --toc \
  --toc-depth=2 \
  --template=template.html \
  -o "$output"

echo "done: $(wc -l < "$output" | tr -d ' ') lines -> $output"
