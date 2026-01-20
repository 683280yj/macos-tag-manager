# 🤖 AI Customization Prompt

If you want an AI (like Claude or ChatGPT) to customize your `tagger.sh` mapping based on your specific files, copy and paste the following prompt:

---

**PROMPT START**

"I am using a macOS tag management script that uses an associative array to map file paths to Finder tags. 

Here is my current home directory file list:
[PASTE YOUR 'ls -a ~' OUTPUT HERE]

Please analyze these files and generate a Zsh associative array mapping called `TAG_MAP` for me. 
Follow these rules:
1. Group shell/terminal configs (zsh, bash, p10k) into 'Terminal-Env'.
2. Group AI/Agent/LLM related folders into 'AI-Workspace' and add a '⭐' tag to them.
3. Group development tools into 'Dev-Core'.
4. Group academic/research tools into 'Research-Acad'.
5. Format the output exactly like this:
   [\"$HOME/.example\"]=\"Tag1,Tag2\"
"

**PROMPT END**
---
