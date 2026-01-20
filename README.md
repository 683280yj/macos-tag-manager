# 🍏 macOS Semantic Tag Manager

[English](./README.md) | [简体中文](./README_CN.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/platform-macOS-000000.svg?logo=apple&logoColor=white)]()

> **"Folders are physical. Tags are logical."**
> Turn your messy Home directory into a structured, semantic workspace in seconds.

---

## 🌟 Why this exists?

In a modern developer workflow, files are scattered across your Home directory: `.zshrc` in the root, projects in `~/git`, AI configs in `~/.agent`. Moving them into subfolders often breaks paths and scripts.

**macOS Semantic Tag Manager** solves this by using Finder Tags. It groups your files by **context** rather than location, allowing you to access everything related to a task (e.g., "Terminal Environment") with a single click in the Finder sidebar.

## 🚀 Quick Start (One-Line Magic)

Run this immediately to tag your system using the default logic:

```zsh
curl -s https://raw.githubusercontent.com/683280yj/macos-tag-manager/main/tagger.sh | zsh
```

---

## 📂 Semantic Logic

The script uses a sophisticated mapping to categorize your workspace:

| Tag | Strategy | Includes |
| :--- | :--- | :--- |
| **`⭐`** | **High Frequency** | Primary Workspace, Active Repos, Zotero |
| **`AI-Workspace`** | **AI Context** | Claude, Gemini, Agent Frameworks, AI Configs |
| **`Terminal-Env`** | **Infrastructure** | Zsh, Bash, p10k, iTerm2 configurations |
| **`Dev-Core`** | **Development** | Docker, OrbStack, Git Config, npm, git directory |
| **`Editor-IDE`** | **Tools** | VS Code, Cursor, LaTeX, IDE Settings |
| **`Research-Acad`** | **Knowledge** | Zotero, Academic papers, Stata |

---

## 🛠️ Customization

1.  **Clone the Repository**:
    ```zsh
    git clone https://github.com/683280yj/macos-tag-manager.git
    cd macos-tag-manager
    ```

2.  **Edit the Mapping**:
    Open `tagger.sh` and modify the `TAG_MAP` associative array. 
    ```zsh
    declare -A TAG_MAP=(
        ["$HOME/MyProject"]="Development,⭐"
        ["$HOME/SecretData"]="Hidden,Private"
    )
    ```

3.  **Run Locally**:
    ```zsh
    chmod +x tagger.sh
    ./tagger.sh
    ```

## 🤖 AI-Powered Mapping

Want a custom mapping based on *your* specific files? 
Use the pre-built prompt in [AI_PROMPT.md](./AI_PROMPT.md) to have Claude or ChatGPT generate a perfect `TAG_MAP` for your directory structure.

---

## 🧩 Requirements

-   **macOS** (tested on Sonoma/Sequoia)
-   **Homebrew**
-   **tag** utility (automatically installed via `brew install tag` if missing)

---

## 🤝 Contributing

Contributions are welcome! If you have a better categorization for common developer tools or want to add support for more apps, feel free to submit a Pull Request.

---
*Crafted for the macOS Power User.*
