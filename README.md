# 🍏 macOS Semantic Tag Manager

> **Turn your messy Home directory into a structured "Column-Based" workspace in 10 seconds.**

This project provides a professional, automated way to manage macOS Finder tags. It categorizes your files not by where they are, but by **how you use them**.

---

## 🌟 Features

-   **Semantic Aggregation**: Group related files (like `.zshrc`, `.p10k.zsh`, `oh-my-zsh`) under a single `Terminal-Env` tag.
-   **Frequency Focus**: Use the `⭐` tag to highlight active AI Agents and Projects.
-   **Clean Workspace**: One-click cleanup of your home directory's visual clutter in Finder.
-   **AI-Ready**: Designed for users who work with LLM frameworks, Agents, and modern dev tools.

## 🚀 One-Line "Magic" (Dummy-Proof)

If you just want to run it immediately on any Mac, paste this into your terminal:

```zsh
curl -s https://raw.githubusercontent.com/YOUR_USERNAME/macos-tag-manager/main/tagger.sh | zsh
```
*(Note: Replace `YOUR_USERNAME` with your actual GitHub username after pushing.)*

---

## 📂 The Tagging Logic

| Tag | Strategy | Includes |
| :--- | :--- | :--- |
| **`⭐`** | **High Frequency** | Active Git repos, AI Agents, Zotero |
| **`AI-Workspace`** | **AI Context** | Claude, Gemini, Agent Frameworks |
| **`Terminal-Env`** | **Background Config** | Zsh, Bash, p10k, iTerm2 settings |
| **`Dev-Core`** | **Infrastructure** | Docker, OrbStack, Git Config, npm |
| **`Editor-IDE`** | **Tools** | VS Code, LaTeX environments |

---

## 🛠️ Manual Installation & Customization

1.  **Clone the Repo**:
    ```zsh
    git clone https://github.com/YOUR_USERNAME/macos-tag-manager.git
    cd macos-tag-manager
    ```

2.  **Customize the Mapping**:
    Open `tagger.sh` and edit the `TAG_MAP` associative array. You can add your own folders or change the tag names.

3.  **Run it**:
    ```zsh
    chmod +x tagger.sh
    ./tagger.sh
    ```

---

## 🧠 Why use this instead of folders?

Folders are physical. Tags are **logical**. 
With this system, your `.zshrc` can stay in your home directory (where it belongs), but you can find it instantly alongside your `iTerm2` configs by clicking the **Terminal-Env** tag in your Finder sidebar.

## 🤝 Contributing
If you have a better categorization for common developer tools, feel free to submit a PR!

---
*Developed with love for the macOS Power User community.*
