# 📚 Example Configurations / 示例配置

[English](#english) | [简体中文](#简体中文)

---

## English

### 📖 Overview

This directory contains **ready-to-use example configurations** for different types of users. These examples demonstrate best practices for organizing your macOS workspace using Finder tags.

### 🎯 Why Use Examples?

Instead of starting from scratch, you can:
- **Learn from real-world setups** used by professionals in your field
- **Quick start** with a proven configuration
- **Customize easily** by modifying the examples to match your specific needs
- **Understand best practices** for semantic tagging

### 📁 Available Examples

| Example | Best For | Key Features |
|---------|----------|--------------|
| **[developer_config.sh](./developer_config.sh)** | Full-Stack Developers | Multi-project management, dev tools, containerization |
| **[researcher_config.sh](./researcher_config.sh)** | Academic Researchers | Papers, data analysis, LaTeX, literature management |
| **[designer_config.sh](./designer_config.sh)** | Creative Designers | Design assets, client projects, inspiration library |
| **[datascientist_config.sh](./datascientist_config.sh)** | Data Scientists / ML Engineers | Datasets, models, notebooks, MLOps tools |

### 🚀 How to Use

#### Step 1: Choose Your Example

Browse the examples above and select the one that best matches your workflow.

#### Step 2: Review and Customize

Open the script and review the `TAG_MAP` configuration:

```bash
# Example from developer_config.sh
declare -A TAG_MAP=(
    ["$HOME/git/my-saas-app"]="Active-Project,⭐,Frontend,Backend"
    ["$HOME/.docker"]="Dev-Core,Container,Docker"
    ...
)
```

**Customize it:**
- Replace example paths with your actual directories
- Add new paths specific to your workflow
- Modify tag names to match your preferences
- Remove mappings for folders you don't have

#### Step 3: Run the Script

```bash
# Make it executable
chmod +x examples/developer_config.sh

# Run it
./examples/developer_config.sh
```

#### Step 4: Verify in Finder

1. Open Finder
2. Look at the sidebar under "Tags"
3. Click on any tag to see filtered files
4. Adjust colors in **System Settings → Finder → Tags**

### 💡 Mixing Examples

You can combine multiple examples! For instance, if you're a researcher who also does web development:

```bash
# Create a custom script
cp examples/researcher_config.sh my_custom_config.sh

# Edit my_custom_config.sh and add relevant sections from developer_config.sh
# Then run your custom script
./my_custom_config.sh
```

### 🎨 Customization Tips

#### 1. Tag Naming Conventions

Choose consistent naming patterns:
- **Context-based**: `AI-Workspace`, `Terminal-Env`, `Dev-Core`
- **Status-based**: `Active-Project`, `Archive`, `Todo`
- **Tech-based**: `Python`, `React`, `Docker`
- **Priority**: Use `⭐` emoji for high-priority items

#### 2. Organizing Multiple Projects

```bash
# Good practice: Group by status and technology
["$HOME/git/project-alpha"]="Active-Project,⭐,React,TypeScript"
["$HOME/git/project-beta"]="Active-Project,⭐,Python,Django"
["$HOME/git/old-project"]="Archive,Completed,React"
```

#### 3. Handling Nested Directories

You can tag both parent and child directories differently:

```bash
["$HOME/Projects"]="Dev-Core,All-Projects"
["$HOME/Projects/client-work"]="Dev-Core,Client,Billable,⭐"
["$HOME/Projects/personal"]="Dev-Core,Personal,Learning"
```

### 🔍 Finding the Right Tags

Not sure what to tag? Use this decision tree:

1. **Is it actively used?** → Add `⭐` or `Active-Project`
2. **What's the domain?** → Add domain tag (Dev, Research, Design, etc.)
3. **What technology?** → Add tech tags (Python, Docker, LaTeX, etc.)
4. **What's the status?** → Add status (Todo, In-Progress, Archive)
5. **Is it sensitive?** → Add `Security` or `Confidential`

### 🛠️ Advanced Usage

#### Using AI to Generate Your Config

See [AI_PROMPT.md](../AI_PROMPT.md) for instructions on having AI generate a custom configuration based on your specific directory structure.

#### Automated Re-tagging

Add the script to your `.zshrc` or create a cron job:

```bash
# In .zshrc
alias retag="~/macos-tag-manager/examples/developer_config.sh"

# Or run weekly via cron
0 9 * * 1 ~/macos-tag-manager/examples/developer_config.sh
```

### ❓ FAQ

**Q: Can I use multiple tags on one file/folder?**  
A: Yes! That's the power of tags. Separate them with commas: `"Active,⭐,Python,ML"`

**Q: Will this overwrite my existing tags?**  
A: Yes, the `-s` flag sets (replaces) tags. To add tags without removing existing ones, change `-s` to `-a` in the script.

**Q: Can I tag files outside my home directory?**  
A: Yes, just use the absolute path in the TAG_MAP.

**Q: How do I remove tags?**  
A: Use `tag -r "TagName" /path/to/file` or remove them in Finder.

---

## 简体中文

### 📖 概述

本目录包含**开箱即用的示例配置**，适用于不同类型的用户。这些示例展示了使用 Finder 标签组织 macOS 工作区的最佳实践。

### 🎯 为什么使用示例？

与从零开始相比，你可以：
- **借鉴真实场景**中专业人士使用的配置
- **快速启动**，使用经过验证的配置
- **轻松定制**，修改示例以匹配你的特定需求
- **学习最佳实践**，掌握语义标签的使用方法

### 📁 可用示例

| 示例 | 适用人群 | 核心特性 |
|------|----------|----------|
| **[developer_config.sh](./developer_config.sh)** | 全栈开发者 | 多项目管理、开发工具、容器化 |
| **[researcher_config.sh](./researcher_config.sh)** | 学术研究人员 | 论文、数据分析、LaTeX、文献管理 |
| **[designer_config.sh](./designer_config.sh)** | 创意设计师 | 设计素材、客户项目、灵感库 |
| **[datascientist_config.sh](./datascientist_config.sh)** | 数据科学家/机器学习工程师 | 数据集、模型、笔记本、MLOps 工具 |

### 🚀 使用方法

#### 步骤 1：选择你的示例

浏览上面的示例，选择最符合你工作流程的那个。

#### 步骤 2：查看并定制

打开脚本并查看 `TAG_MAP` 配置：

```bash
# developer_config.sh 示例
declare -A TAG_MAP=(
    ["$HOME/git/my-saas-app"]="Active-Project,⭐,Frontend,Backend"
    ["$HOME/.docker"]="Dev-Core,Container,Docker"
    ...
)
```

**定制方法：**
- 将示例路径替换为你的实际目录
- 添加特定于你工作流程的新路径
- 修改标签名称以匹配你的偏好
- 删除你没有的文件夹映射

#### 步骤 3：运行脚本

```bash
# 添加执行权限
chmod +x examples/developer_config.sh

# 运行
./examples/developer_config.sh
```

#### 步骤 4：在 Finder 中验证

1. 打开 Finder
2. 查看侧边栏的"标签"部分
3. 点击任意标签查看筛选后的文件
4. 在**系统设置 → Finder → 标签**中调整颜色

### 💡 混合使用示例

你可以组合多个示例！例如，如果你既是研究人员又做 Web 开发：

```bash
# 创建自定义脚本
cp examples/researcher_config.sh my_custom_config.sh

# 编辑 my_custom_config.sh，添加 developer_config.sh 的相关部分
# 然后运行你的自定义脚本
./my_custom_config.sh
```

### 🎨 定制技巧

#### 1. 标签命名规范

选择一致的命名模式：
- **基于上下文**: `AI-Workspace`、`Terminal-Env`、`Dev-Core`
- **基于状态**: `Active-Project`、`Archive`、`Todo`
- **基于技术**: `Python`、`React`、`Docker`
- **优先级**: 使用 `⭐` emoji 标记高优先级项

#### 2. 组织多个项目

```bash
# 良好实践：按状态和技术分组
["$HOME/git/project-alpha"]="Active-Project,⭐,React,TypeScript"
["$HOME/git/project-beta"]="Active-Project,⭐,Python,Django"
["$HOME/git/old-project"]="Archive,Completed,React"
```

#### 3. 处理嵌套目录

你可以对父目录和子目录设置不同的标签：

```bash
["$HOME/Projects"]="Dev-Core,All-Projects"
["$HOME/Projects/client-work"]="Dev-Core,Client,Billable,⭐"
["$HOME/Projects/personal"]="Dev-Core,Personal,Learning"
```

### 🔍 选择合适的标签

不确定打什么标签？使用这个决策树：

1. **是否经常使用？** → 添加 `⭐` 或 `Active-Project`
2. **属于什么领域？** → 添加领域标签（Dev、Research、Design 等）
3. **使用什么技术？** → 添加技术标签（Python、Docker、LaTeX 等）
4. **处于什么状态？** → 添加状态（Todo、In-Progress、Archive）
5. **是否敏感？** → 添加 `Security` 或 `Confidential`

### 🛠️ 高级用法

#### 使用 AI 生成你的配置

查看 [AI_PROMPT.md](../AI_PROMPT.md)，了解如何让 AI 根据你的特定目录结构生成自定义配置。

#### 自动重新标记

将脚本添加到 `.zshrc` 或创建定时任务：

```bash
# 在 .zshrc 中
alias retag="~/macos-tag-manager/examples/developer_config.sh"

# 或通过 cron 每周运行
0 9 * * 1 ~/macos-tag-manager/examples/developer_config.sh
```

### ❓ 常见问题

**问：一个文件/文件夹可以使用多个标签吗？**  
答：可以！这就是标签的强大之处。用逗号分隔：`"Active,⭐,Python,ML"`

**问：这会覆盖我现有的标签吗？**  
答：是的，`-s` 标志会设置（替换）标签。如果想在不删除现有标签的情况下添加新标签，将脚本中的 `-s` 改为 `-a`。

**问：可以标记主目录之外的文件吗？**  
答：可以，在 TAG_MAP 中使用绝对路径即可。

**问：如何删除标签？**  
答：使用 `tag -r "TagName" /path/to/file` 或在 Finder 中删除。

---

### 🤝 贡献

如果你有适合特定职业或工作流程的优秀示例配置，欢迎提交 PR！

### 📄 许可证

MIT License

---

*用 ❤️ 为 macOS 用户创作*
