# 🍏 macOS 语义标签管理器 (macOS Semantic Tag Manager)

[English](./README.md) | [简体中文](./README_CN.md)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/platform-macOS-000000.svg?logo=apple&logoColor=white)](https://www.apple.com/cn/macos/)
[![GitHub stars](https://img.shields.io/github/stars/683280yj/macos-tag-manager?style=social)](https://github.com/683280yj/macos-tag-manager/stargazers)

## ⭐ Star 趋势

[![Star History Chart](https://api.star-history.com/svg?repos=683280yj/macos-tag-manager&type=Date)](https://star-history.com/#683280yj/macos-tag-manager&Date)

> **“文件夹是物理单位，标签是逻辑单位。”**
> 在几秒钟内，将你混乱的用户主目录转变为结构化的语义工作区。

---

## 🌟 为什么需要它？

在现代开发工作流中，文件散落在主目录的各个角落：根目录下的 `.zshrc`，`~/git` 中的项目，`~/.agent` 中的 AI 配置。将它们移入子文件夹往往会破坏路径和脚本。

**macOS 语义标签管理器** 通过 Finder 标签（Tags）解决了这个问题。它根据 **上下文** 而非位置对文件进行分组，让你只需在 Finder 侧边栏点击一下，即可访问与任务相关的所有内容（例如“终端环境”）。

## 🚀 快速开始

### 方式一：语义化标签（开发者推荐）

按上下文（终端、AI、开发等）为主目录文件打标签：

```zsh
curl -s https://raw.githubusercontent.com/683280yj/macos-tag-manager/main/tagger.sh | zsh
```

### 方式二：智能整理系统（基于使用频次）🔥 新功能

根据**使用频次**自动整理文件，使用 Emoji 可视化标签：

```zsh
curl -s https://raw.githubusercontent.com/683280yj/macos-tag-manager/main/smart_organize.sh | zsh
```

功能特性：
- 🔥 自动识别高频文件（最近 7 天访问）
- 📚 智能分类学术论文、工作文档、媒体素材
- 🗑️ 识别可删除的临时文件和系统垃圾
- 🎨 Emoji 可视化标签，一目了然

👉 [了解智能整理系统详情](./SMART_ORGANIZE.md)

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

## 🙏 致谢

本项目站在巨人的肩膀上：

- **[Homebrew](https://brew.sh/zh-cn/)** - 让 macOS 开发成为可能的必备包管理器
- **[tag](https://github.com/jdberry/tag)** - 驱动我们标签系统的出色命令行工具
- **[Oh My Zsh](https://ohmyz.sh)** - 让终端定制变得愉悦
- **[Powerlevel10k](https://github.com/romkatv/powerlevel10k)** - 启发语义化组织的精美提示符
- **macOS Finder** - 强大的原生标签系统
- **开源社区** - 持续的灵感和协作

特别感谢所有帮助改进文件组织工作流程的贡献者！

---

## 📊 项目统计

![GitHub repo size](https://img.shields.io/github/repo-size/683280yj/macos-tag-manager)
![GitHub last commit](https://img.shields.io/github/last-commit/683280yj/macos-tag-manager)
![GitHub issues](https://img.shields.io/github/issues/683280yj/macos-tag-manager)

---

*为 macOS 进阶用户精心打造。用 ❤️ 为开发者社区创作。*
