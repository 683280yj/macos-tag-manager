---
name: macos-tag-manager
description: Automate and customize macOS Finder tags for organizing home-directory files using the macos-tag-manager repository. Use when setting up or tweaking semantic tagging with tagger.sh, running smart_organize.sh for frequency-based emoji tags, or documenting/installing prerequisites (Homebrew + tag utility).
---

# macOS Tag Manager

## Overview
Use this skill to apply or customize Finder tag automation with the repo scripts. Focus on guiding users through prerequisites, choosing the right script, and editing tag mappings safely.

## Quick decision guide
- **Semantic tagging by context** → use `tagger.sh`.
- **Frequency-based smart organization** → use `smart_organize.sh`.
- **Need custom mappings** → edit `TAG_MAP` in `tagger.sh` before running.

## Workflow
1. **Confirm prerequisites**
   - macOS.
   - Homebrew installed.
   - `tag` CLI available (install with `brew install tag` if missing).
2. **Pick the script**
   - `tagger.sh` for semantic/context tags.
   - `smart_organize.sh` for usage-frequency emoji tags.
3. **Customize (optional)**
   - Edit `TAG_MAP` in `tagger.sh` to add/remove paths and tags.
   - Keep tags comma-separated (e.g., `"Development,⭐"`).
4. **Run**
   - `chmod +x tagger.sh && ./tagger.sh`
   - or `chmod +x smart_organize.sh && ./smart_organize.sh`
5. **Verify**
   - Ask the user to check Finder tags or the Finder sidebar for tag groups.

## Guidance for changes
- When modifying `TAG_MAP`, preserve the associative array structure and quote paths.
- Avoid tagging system-critical directories unless the user confirms.
- If a user wants AI-generated mappings, point them to `AI_PROMPT.md` and offer to draft a mapping.
