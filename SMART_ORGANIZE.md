# 🎯 智能文件整理系统

[English](#english) | [简体中文](#简体中文)

---

## 简体中文

### 📖 概述

基于 **使用频次分析** + **Emoji 可视化** + **macOS 最佳实践** 的智能文件整理系统，自动为您的文件打上语义化标签。

### 🌟 核心特性

#### 1. 智能频次识别
- 🔥 **自动识别高频文件**：分析最近 7 天访问的文件，自动标记为"🔥 常用"
- 📊 **数据驱动决策**：基于实际使用情况而非主观判断

#### 2. Emoji 可视化标签
- 🎨 **一目了然**：所有标签带 Emoji，Finder 侧边栏视觉直观
- 🌈 **颜色心理学**：红色=紧急、蓝色=学术、紫色=工作

#### 3. 智能语义分类
| 标签 | 含义 | 应用场景 |
|------|------|----------|
| 🔥 常用 | 高频文件 | 自动识别最近 7 天访问 |
| ⭐ 进行中 | 活跃项目 | 正在开发的项目、频繁使用的工具 |
| 📚 学术 | 学术研究 | 论文、文献、数据分析 |
| 💼 工作 | 工作课程 | PPT、作业、课程资料 |
| 📄 文档 | 文档资料 | 个人文档、通用资料 |
| 🎨 素材 | 媒体素材 | 图片、视频、截图 |
| ⚙️ 配置 | 系统配置 | `.zshrc`, `.env`, `.gitconfig` 等 |
| 📦 归档 | 备份归档 | 旧版本、备份文件 |
| 🗑️ 待删 | 可删除 | 临时文件、系统垃圾 |

### 🚀 快速开始

#### 方式一：一键运行（推荐）

```bash
curl -s https://raw.githubusercontent.com/683280yj/macos-tag-manager/main/smart_organize.sh | zsh
```

#### 方式二：本地运行

```bash
# 克隆仓库
git clone https://github.com/683280yj/macos-tag-manager.git
cd macos-tag-manager

# 添加执行权限
chmod +x smart_organize.sh

# 运行脚本
./smart_organize.sh
```

### 💡 使用方法

#### Finder 快速筛选
1. 打开 Finder
2. 查看侧边栏"标签"部分
3. 点击任意标签（如 🔥 常用）即可筛选文件

#### Spotlight 搜索
```
搜索 "常用"  → 找到所有高频文件
搜索 "学术"  → 找到所有论文文献
搜索 "待删"  → 找到可清理内容
```

#### 自定义颜色
1. 系统设置 → Finder → 标签
2. 为每个标签选择对应颜色

### 🎯 智能分类逻辑

#### Home 目录
- **⭐ 进行中**：`Claudix`, `git`, `Zotero` 等活跃项目
- **⚙️ 配置**：`.zshrc`, `.gitconfig`, `.ssh` 等配置文件
- **📚 学术**：`Zotero`, `stata-mcp` 等学术工具
- **📄 文档**：`Desktop`, `Documents` 等标准目录

#### Downloads 目录
- **📚 学术**：论文 PDF、Stata 数据、研究文档
- **💼 工作**：PPT、课程资料、作业
- **📄 文档**：个人文档、Word/Excel 文件
- **🎨 素材**：图片、视频等媒体文件
- **🗑️ 待删**：临时文件夹、系统垃圾、空文件

### 🗑️ 清理建议

运行脚本后，系统会自动标记可删除内容：

**常见待删除项目：**
- 临时文件夹（测试、临时数据处理）
- 系统垃圾（`.DS_Store`, `Thumbs.db`）
- 空文件
- 重复文件、下载工具残留

**清理步骤：**
1. Finder 侧边栏 → 点击 🗑️ 待删
2. 检查列表确认
3. 全选 → 移到废纸篓

### 📚 设计原则

本系统基于以下最佳实践设计：

#### macOS 官方指南
- 使用 Finder 标签而非移动文件
- 一个文件可有多个标签
- 标签名应清晰、描述性强

#### 颜色心理学
- 🔥 红色：紧急、重要（高频文件）
- 📚 蓝色：专业、学术（研究资料）
- 💼 紫色：工作、职业（工作文档）
- 🎨 黄色：创意、灵感（媒体素材）
- ⚙️ 灰色：系统、技术（配置文件）

#### 使用频次优先
- 自动识别最近访问的文件
- 高频文件自动标记为 🔥 常用
- 数据驱动，动态调整

### 🔧 自定义

编辑 `smart_organize.sh` 中的标签定义：

```bash
# 修改标签名称
T_HOT="🔥 My Frequent Files"
T_STUDY="📚 My Research"

# 添加自定义分类
find "$DOWNLOAD_DIR" -name "MyProject*" -exec "$TAG_BIN" -s "⭐ 进行中" {} +
```

### 🤝 贡献

欢迎提交 PR 改进分类逻辑或添加新功能！

### 📄 许可证

MIT License

---

## English

### 📖 Overview

An intelligent file organization system based on **usage frequency analysis** + **Emoji visualization** + **macOS best practices**, automatically applying semantic tags to your files.

### 🌟 Key Features

#### 1. Smart Frequency Recognition
- 🔥 **Auto-detect frequently used files**: Analyzes files accessed in the last 7 days, automatically tagged as "🔥 Hot"
- 📊 **Data-driven decisions**: Based on actual usage patterns, not subjective judgment

#### 2. Emoji Visual Tags
- 🎨 **Intuitive at a glance**: All tags include Emojis, visually clear in Finder sidebar
- 🌈 **Color psychology**: Red=Urgent, Blue=Academic, Purple=Work

#### 3. Smart Semantic Classification

| Tag | Meaning | Use Case |
|-----|---------|----------|
| 🔥 Hot | High frequency | Auto-detected files accessed in last 7 days |
| ⭐ Active | Active projects | Currently developing projects, frequently used tools |
| 📚 Academic | Research | Papers, literature, data analysis |
| 💼 Work | Work/Courses | Presentations, assignments, course materials |
| 📄 Docs | Documents | Personal docs, general materials |
| 🎨 Media | Media assets | Images, videos, screenshots |
| ⚙️ Config | System config | `.zshrc`, `.env`, `.gitconfig`, etc. |
| 📦 Archive | Backup | Old versions, backup files |
| 🗑️ Trash | Deletable | Temp files, system junk |

### 🚀 Quick Start

#### Option 1: One-line Magic (Recommended)

```bash
curl -s https://raw.githubusercontent.com/683280yj/macos-tag-manager/main/smart_organize.sh | zsh
```

#### Option 2: Local Execution

```bash
# Clone the repository
git clone https://github.com/683280yj/macos-tag-manager.git
cd macos-tag-manager

# Add execute permission
chmod +x smart_organize.sh

# Run the script
./smart_organize.sh
```

### 💡 How to Use

#### Finder Quick Filtering
1. Open Finder
2. Check the "Tags" section in the sidebar
3. Click any tag (e.g., 🔥 Hot) to filter files

#### Spotlight Search
```
Search "Hot"      → Find all frequently used files
Search "Academic" → Find all research papers
Search "Trash"    → Find deletable content
```

#### Customize Colors
1. System Settings → Finder → Tags
2. Choose corresponding colors for each tag

### 🎯 Smart Classification Logic

#### Home Directory
- **⭐ Active**: `Claudix`, `git`, `Zotero` and other active projects
- **⚙️ Config**: `.zshrc`, `.gitconfig`, `.ssh` and other config files
- **📚 Academic**: `Zotero`, `stata-mcp` and other research tools
- **📄 Docs**: `Desktop`, `Documents` and other standard folders

#### Downloads Directory
- **📚 Academic**: Research PDFs, Stata data, research docs
- **💼 Work**: Presentations, course materials, assignments
- **📄 Docs**: Personal documents, Word/Excel files
- **🎨 Media**: Images, videos and other media files
- **🗑️ Trash**: Temp folders, system junk, empty files

### 🗑️ Cleanup Recommendations

After running the script, the system automatically marks deletable content:

**Common deletable items:**
- Temp folders (test, temp data processing)
- System junk (`.DS_Store`, `Thumbs.db`)
- Empty files
- Duplicate files, download tool residues

**Cleanup steps:**
1. Finder sidebar → Click 🗑️ Trash tag
2. Review the list
3. Select all → Move to Trash

### 📚 Design Principles

This system is designed based on the following best practices:

#### macOS Official Guidelines
- Use Finder tags instead of moving files
- A file can have multiple tags
- Tag names should be clear and descriptive

#### Color Psychology
- 🔥 Red: Urgent, important (high-frequency files)
- 📚 Blue: Professional, academic (research materials)
- 💼 Purple: Work, professional (work documents)
- 🎨 Yellow: Creative, inspiration (media assets)
- ⚙️ Gray: System, technical (config files)

#### Usage Frequency Priority
- Auto-detect recently accessed files
- High-frequency files automatically tagged as 🔥 Hot
- Data-driven, dynamically adjusted

### 🔧 Customization

Edit tag definitions in `smart_organize.sh`:

```bash
# Modify tag names
T_HOT="🔥 My Frequent Files"
T_STUDY="📚 My Research"

# Add custom classification
find "$DOWNLOAD_DIR" -name "MyProject*" -exec "$TAG_BIN" -s "⭐ Active" {} +
```

### 🤝 Contributing

Welcome to submit PRs to improve classification logic or add new features!

### 📄 License

MIT License

---

## 📚 References

- [macOS File Tag Best Practices](https://support.apple.com/guide/mac-help/tag-files-and-folders-mchlp15236/mac)
- [File Management Tag Systems](https://csdn.net)
- [macOS Tahoe Features](https://www.apple.com)

---

*Crafted for the macOS Power User. 为 macOS 专业用户打造。*
