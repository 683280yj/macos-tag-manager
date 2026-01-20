# 🍏 macOS 语义标签管理器 (macOS Semantic Tag Manager)

[English](./README.md) | [简体中文](./README_CN.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/platform-macOS-000000.svg?logo=apple&logoColor=white)]()

> **“文件夹是物理单位，标签是逻辑单位。”**
> 在几秒钟内，将你混乱的用户主目录转变为结构化的语义工作区。

---

## 🌟 为什么需要它？

在现代开发工作流中，文件散落在主目录的各个角落：根目录下的 `.zshrc`，`~/git` 中的项目，`~/.agent` 中的 AI 配置。将它们移入子文件夹往往会破坏路径和脚本。

**macOS 语义标签管理器** 通过 Finder 标签（Tags）解决了这个问题。它根据 **上下文** 而非位置对文件进行分组，让你只需在 Finder 侧边栏点击一下，即可访问与任务相关的所有内容（例如“终端环境”）。

## 🚀 快速开始（一行代码搞定）

直接运行以下命令，使用默认逻辑为你的系统打标签：

```zsh
curl -s https://raw.githubusercontent.com/683280yj/macos-tag-manager/main/tagger.sh | zsh
```

---

## 📂 语义逻辑

脚本使用一套精心设计的映射来分类你的工作区：

| 标签 | 策略 | 包含内容示例 |
| :--- | :--- | :--- |
| **`⭐`** | **高频访问** | 主要工作区、活跃项目、Zotero |
| **`AI-Workspace`** | **AI 上下文** | Claude, Gemini, Agent 框架, AI 配置文件 |
| **`Terminal-Env`** | **基础设施** | Zsh, Bash, p10k, iTerm2 配置 |
| **`Dev-Core`** | **开发核心** | Docker, OrbStack, Git 配置, npm, git 目录 |
| **`Editor-IDE`** | **工具** | VS Code, Cursor, LaTeX, IDE 设置 |
| **`Research-Acad`** | **知识库** | Zotero, 论文, 研究工具 |

---

## 🛠️ 自定义

1.  **克隆仓库**:
    ```zsh
    git clone https://github.com/683280yj/macos-tag-manager.git
    cd macos-tag-manager
    ```

2.  **编辑映射**:
    打开 `tagger.sh` 并修改 `TAG_MAP` 关联数组。
    ```zsh
    declare -A TAG_MAP=(
        ["$HOME/我的项目"]="Development,⭐"
        ["$HOME/机密数据"]="Hidden,Private"
    )
    ```

3.  **本地运行**:
    ```zsh
    chmod +x tagger.sh
    ./tagger.sh
    ```

## 🤖 AI 驱动的映射生成

想要根据你*特定*的文件列表生成自定义映射吗？
使用 [AI_PROMPT.md](./AI_PROMPT.md) 中预设的提示词，让 Claude 或 ChatGPT 为你的目录结构生成完美的 `TAG_MAP`。

---

## 🧩 要求

-   **macOS** (已在 Sonoma/Sequoia 上测试)
-   **Homebrew**
-   **tag** 工具（如果缺失，脚本会自动通过 `brew install tag` 安装）

---

## 🤝 贡献

欢迎贡献！如果你对常用开发工具有更好的分类建议，或者想增加对更多应用的支持，请随时提交 Pull Request。

---
*为 macOS 进阶用户精心打造。*
