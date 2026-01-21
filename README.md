# 🍏 macOS Semantic Tag Manager

[English](./README.md) | [简体中文](./README_CN.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/platform-macOS-000000.svg?logo=apple&logoColor=white)](https://www.apple.com/macos/)
[![GitHub stars](https://img.shields.io/github/stars/683280yj/macos-tag-manager?style=social)](https://github.com/683280yj/macos-tag-manager/stargazers)

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=683280yj/macos-tag-manager&type=Date)](https://star-history.com/#683280yj/macos-tag-manager&Date)

> **"Folders are physical. Tags are logical."**
> Turn your messy Home directory into a structured, semantic workspace in seconds.

---

## 🌟 Why this exists?

In a modern developer workflow, files are scattered across your Home directory: `.zshrc` in the root, projects in `~/git`, AI configs in `~/.agent`. Moving them into subfolders often breaks paths and scripts.

**macOS Semantic Tag Manager** solves this by using Finder Tags. It groups your files by **context** rather than location, allowing you to access everything related to a task (e.g., "Terminal Environment") with a single click in the Finder sidebar.

## 🚀 Quick Start

### Option 1: Semantic Tagging (For Developers)

Tag your Home directory files by context (Terminal, AI, Dev, etc.):

```zsh
curl -s https://raw.githubusercontent.com/683280yj/macos-tag-manager/main/tagger.sh | zsh
```

### Option 2: Smart Organization (Frequency-Based) 🔥 NEW

Automatically organize files based on **usage frequency** with Emoji tags:

```zsh
curl -s https://raw.githubusercontent.com/683280yj/macos-tag-manager/main/smart_organize.sh | zsh
```

Features:
- 🔥 Auto-detects frequently accessed files (last 7 days)
- 📚 Smart classification for academic papers, work docs, media
- 🗑️ Identifies deletable temp files and system junk
- 🎨 Visual Emoji tags for quick recognition

👉 [Learn more about Smart Organization](./SMART_ORGANIZE.md)

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

## 🙏 Acknowledgments

This project stands on the shoulders of giants:

- **[Homebrew](https://brew.sh)** - The essential package manager that makes macOS development possible
- **[tag](https://github.com/jdberry/tag)** - The brilliant CLI utility that powers our tagging system
- **[Oh My Zsh](https://ohmyz.sh)** - For making terminal customization delightful
- **[Powerlevel10k](https://github.com/romkatv/powerlevel10k)** - The beautiful prompt that inspired semantic organization
- **macOS Finder** - For the powerful native tagging system
- **The Open Source Community** - For continuous inspiration and collaboration

Special thanks to all contributors who help improve file organization workflows!

---

## 📊 Project Stats

![GitHub repo size](https://img.shields.io/github/repo-size/683280yj/macos-tag-manager)
![GitHub last commit](https://img.shields.io/github/last-commit/683280yj/macos-tag-manager)
![GitHub issues](https://img.shields.io/github/issues/683280yj/macos-tag-manager)

---

*Crafted for the macOS Power User. Made with ❤️ for the developer community.*
