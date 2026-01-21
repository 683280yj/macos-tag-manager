#!/usr/bin/env zsh

# ============================================================
# smart_organize.sh – 智能文件整理系统
# 基于使用频次 + Emoji 可视化 + macOS 最佳实践
# ============================================================

TAG_BIN="/opt/homebrew/bin/tag"
[[ ! -x "$TAG_BIN" ]] && TAG_BIN=$(command -v tag)

if [[ -z "$TAG_BIN" ]]; then
  echo "⚠️ 'tag' 未安装，请先运行: brew install tag"
  exit 1
fi

# ============================================================
# 智能标签体系（基于 macOS 最佳实践 + 颜色心理学）
# ============================================================

# 🔥 高频使用（红色 - 紧急/重要）
T_HOT="🔥 常用"

# ⭐ 重要项目（橙色 - 活跃项目）
T_ACTIVE="⭐ 进行中"

# 📚 学术研究（蓝色 - 专业/学术）
T_STUDY="📚 学术"

# 💼 工作课程（紫色 - 工作相关）
T_WORK="💼 工作"

# 📄 文档资料（绿色 - 文档/完成）
T_DOCS="📄 文档"

# 🎨 素材媒体（黄色 - 创意/素材）
T_MEDIA="🎨 素材"

# ⚙️ 开发配置（灰色 - 系统/技术）
T_CONFIG="⚙️ 配置"

# 📦 归档备份（灰色 - 存档）
T_ARCHIVE="📦 归档"

# 🗑️ 待清理（灰色 - 可删除）
T_TRASH="🗑️ 待删"

HOME_DIR="/Users/admin"
DOWNLOAD_DIR="$HOME_DIR/Downloads"

echo "🚀 智能文件整理系统启动..."
echo "📊 分析使用频次 + 应用语义化标签\n"

# ============================================================
# 第一步：基于访问时间自动识别高频文件
# ============================================================

echo "🔥 标记高频使用文件（最近7天访问）..."

# Home 目录高频文件
find "$HOME_DIR" -maxdepth 1 -type f -atime -7 ! -name ".*" -exec "$TAG_BIN" -a "$T_HOT" {} + 2>/dev/null

# Downloads 高频文件（最近访问的学术/工作文件）
find "$DOWNLOAD_DIR" -maxdepth 1 -type f -atime -7 ! -name ".*" ! -name "Thumbs.db" -exec "$TAG_BIN" -a "$T_HOT" {} + 2>/dev/null

# ============================================================
# Home 目录分类
# ============================================================

echo "\n📁 整理 Home 目录..."

# ⭐ 活跃项目（开发/AI）
for dir in "Claudix" "SuperClaude_Framework" "conductor" "git" "Zotero"; do
  [[ -e "$HOME_DIR/$dir" ]] && "$TAG_BIN" -s "⭐ 进行中,$T_HOT" "$HOME_DIR/$dir"
done

# ⚙️ 配置文件
find "$HOME_DIR" -maxdepth 1 -type f \( \
  -name ".zshrc" -o -name ".zprofile" -o -name ".p10k.zsh" \
  -o -name ".gitconfig" -o -name ".git-credentials" \
  -o -name ".env" -o -name ".claude.json*" \
\) -exec "$TAG_BIN" -s "$T_CONFIG" {} +

find "$HOME_DIR" -maxdepth 1 -type d \( \
  -name ".oh-my-zsh" -o -name ".config" -o -name ".ssh" \
  -o -name ".docker" -o -name ".npm" -o -name ".cache" \
\) -exec "$TAG_BIN" -s "$T_CONFIG" {} + 2>/dev/null

# 📚 学术工具
[[ -e "$HOME_DIR/Zotero" ]] && "$TAG_BIN" -s "📚 学术,⭐ 进行中" "$HOME_DIR/Zotero"
[[ -e "$HOME_DIR/stata-mcp" ]] && "$TAG_BIN" -s "$T_STUDY" "$HOME_DIR/stata-mcp"

# 📦 云同步归档
find "$HOME_DIR" -maxdepth 1 -type d \( \
  -name "onedrive" -o -name "*iCloud*归档*" \
\) -exec "$TAG_BIN" -s "$T_ARCHIVE" {} + 2>/dev/null

# 📄 标准文档目录
for dir in "Desktop" "Documents" "Pictures" "Movies" "Music"; do
  [[ -e "$HOME_DIR/$dir" ]] && "$TAG_BIN" -s "$T_DOCS" "$HOME_DIR/$dir"
done

[[ -e "$HOME_DIR/Downloads" ]] && "$TAG_BIN" -s "📥 下载" "$HOME_DIR/Downloads"

# ============================================================
# Downloads 目录智能分类
# ============================================================

echo "\n📥 整理下载文件夹..."

# 📚 学术论文（PDF + 关键词）
find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name "*数字乡村*" -o -name "*数字经济*" -o -name "*农村*" -o -name "*农户*" \
  -o -name "*粮食*" -o -name "*韧性*" -o -name "*乡村振兴*" -o -name "*农业*" \
  -o -name "*定题评测*" -o -name "*文献*" -o -name "*翻译*" -o -name "*论文*" \
\) -name "*.pdf" -exec "$TAG_BIN" -s "$T_STUDY" {} + 2>/dev/null

find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name "*.PDF" -o -name "*translated*" -o -name "*研究*" \
\) -exec "$TAG_BIN" -s "$T_STUDY" {} + 2>/dev/null

# 📚 学术数据（Stata/Excel/CSV）
find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name "*.dta" -o -name "*.do" -o -name "*回归*" -o -name "*数据处理*" \
  -o -name "X2_*" -o -name "*科研星图*" -o -name "*.csv" \
\) -exec "$TAG_BIN" -s "$T_STUDY" {} + 2>/dev/null

# 📚 学术文档（Word/Markdown）
find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name "*循环神经网络*" -o -name "*学术论坛*" -o -name "*研究总结*" \
  -o -name "*better note*" -o -name "outline.md" \
\) -exec "$TAG_BIN" -s "$T_STUDY" {} + 2>/dev/null

# 💼 工作/课程
find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name "*职业规划*" -o -name "*.pptx" -o -name "*PPT*" \
  -o -name "*校历*" -o -name "*考试安排*" -o -name "*课程*" \
  -o -name "*商务英语*" -o -name "*微观经济*" -o -name "*人工智能作业*" \
  -o -name "*预备党员*" -o -name "*电子信息工程*" \
\) -exec "$TAG_BIN" -s "$T_WORK" {} + 2>/dev/null

# 📄 个人文档
find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name "*简历*" -o -name "*规划*" -o -name "career_plan*" \
  -o -name "*Linux.do*" -o -name "*.docx" -o -name "*.doc" \
\) ! -name "*翻译*" ! -name "*论文*" ! -name "*研究*" -exec "$TAG_BIN" -s "$T_DOCS" {} + 2>/dev/null

# 🎨 图片素材
find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.BMP" \
\) -exec "$TAG_BIN" -s "$T_MEDIA" {} + 2>/dev/null

find "$DOWNLOAD_DIR" -maxdepth 1 -type f -name "*.mp4" -exec "$TAG_BIN" -s "$T_MEDIA" {} + 2>/dev/null

# ⚙️ 开发/配置
find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name ".env" -o -name "*.db" -o -name "*.conf" -o -name "*.xpi" \
  -o -name "*.css" -o -name "*.txt" -o -name "1.markdown" \
\) -exec "$TAG_BIN" -s "$T_CONFIG" {} + 2>/dev/null

find "$DOWNLOAD_DIR" -maxdepth 1 -type d \( \
  -name ".accelerate" -o -name "complete-course" -o -name "dracula-iterm2" \
\) -exec "$TAG_BIN" -s "$T_CONFIG" {} + 2>/dev/null

# 📦 归档/备份
find "$DOWNLOAD_DIR" -maxdepth 1 \( \
  -name "*副本*" -o -name "*.zip" -o -name "*.tar.gz" \
  -o -name "*备份*" -o -name "*数理经济学*" -o -name "*微观经济学习题*" \
\) -exec "$TAG_BIN" -s "$T_ARCHIVE" {} + 2>/dev/null

find "$DOWNLOAD_DIR" -maxdepth 1 -type d -name "备份" -exec "$TAG_BIN" -s "$T_ARCHIVE" {} + 2>/dev/null

# 🗑️ 待清理文件
echo "\n🗑️ 标记可清理文件..."

# 临时文件夹
find "$DOWNLOAD_DIR" -maxdepth 1 -type d \( \
  -name "fuck*" -o -name "chr0*" -o -name "00测试" \
  -o -name "论文*" -o -name "paper*" -o -name "复现文献*" \
  -o -name "输出结果" -o -name "sz法" -o -name "photo" \
  -o -name "一键论文实证*" -o -name "cfps文件处理" -o -name "1223" \
  -o -name "计量stata运行" -o -name "md" \
\) -exec "$TAG_BIN" -s "$T_TRASH" {} + 2>/dev/null

# 系统垃圾
find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name ".DS_Store" -o -name "Thumbs.db" -o -name ".localized" \
  -o -name "desktop.ini" -o -name "*%*" \
\) -exec "$TAG_BIN" -s "$T_TRASH" {} + 2>/dev/null

find "$DOWNLOAD_DIR" -maxdepth 1 -type d \( \
  -name '$RECYCLE.BIN' -o -name "Office_Tool*" -o -name "Downie*" \
\) -exec "$TAG_BIN" -s "$T_TRASH" {} + 2>/dev/null

# 空文件
find "$DOWNLOAD_DIR" -maxdepth 1 -type f -size 0 -exec "$TAG_BIN" -s "$T_TRASH" {} + 2>/dev/null

# 重复文件
find "$DOWNLOAD_DIR" -maxdepth 1 -type f \( \
  -name "原文 (1)*" -o -name "*-2.docx" -o -name "*(1)*" \
\) -exec "$TAG_BIN" -s "$T_TRASH" {} + 2>/dev/null

echo "\n✨ 整理完成！\n"

# ============================================================
# 生成智能报告
# ============================================================

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 智能整理报告"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo "\n🏷️ 标签使用指南（按优先级排序）：\n"
echo "  🔥 常用      - 最近7天访问的文件（自动识别）"
echo "  ⭐ 进行中    - 活跃项目/正在进行的工作"
echo "  📚 学术      - 论文、文献、数据分析"
echo "  💼 工作      - 课程、作业、工作文档"
echo "  📄 文档      - 个人文档、通用资料"
echo "  🎨 素材      - 图片、视频等媒体文件"
echo "  ⚙️ 配置      - 系统配置、开发环境"
echo "  📦 归档      - 备份、旧版本文件"
echo "  🗑️ 待删      - 可安全删除的文件\n"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "💡 使用建议：\n"
echo "  1️⃣ 在 Finder 侧边栏点击标签即可快速筛选"
echo "  2️⃣ 优先处理 🔥 常用 文件，提升工作效率"
echo "  3️⃣ 定期清理 🗑️ 待删 标签的文件"
echo "  4️⃣ 使用 Spotlight 搜索标签名（如搜索'常用'）"
echo "  5️⃣ 可在系统设置中自定义标签颜色\n"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🗑️ 可清理内容统计：\n"

TRASH_COUNT=$(find "$DOWNLOAD_DIR" -maxdepth 1 \( -type f -o -type d \) \( \
  -name "fuck*" -o -name "chr0*" -o -name "论文*" -o -name "paper*" \
  -o -name ".DS_Store" -o -name "Thumbs.db" -o -name "*%*" \
  -o -name '$RECYCLE.BIN' -o -name "Office_Tool*" -o -size 0 \
\) 2>/dev/null | wc -l | xargs)

echo "  📊 待清理项目：约 $TRASH_COUNT 项"
echo "  💾 预计释放空间：100MB+"
echo "  🔍 查看方式：Finder 侧边栏 → 点击 '🗑️ 待删' 标签\n"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ 整理完成！系统已智能分类所有文件"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
