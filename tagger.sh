#!/usr/bin/env zsh

# ==============================================================================
# macOS Universal Semantic Tagger
# Version: 1.0.0
# Description: Automatically categories Mac home folders using Finder Tags.
# ==============================================================================

# --- 1. Environment Check & Tool Installation ---
echo "🔍 Checking environment..."

# Check for Homebrew
if ! command -v brew >/dev/null 2>&1; then
    echo "❌ Homebrew not found. This script requires Homebrew to install the 'tag' utility."
    echo "Please install it first: https://brew.sh"
    exit 1
fi

# Check/Install 'tag' utility
if ! command -v tag >/dev/null 2>&1; then
    echo "📦 'tag' utility not found. Installing via Homebrew..."
    brew install tag
fi

TAG_BIN=$(command -v tag)

# --- 2. Configuration (The Semantic Logic) ---
# Feel free to edit this mapping to suit your workflow.
# Format: ["path"]="Tag1,Tag2,ColorTag"

T_AI="AI-Workspace,⭐"
T_ENV="Terminal-Env"
T_DEV="Dev-Core"
T_STD="Standard-Folder"
T_ACAD="Research-Acad"
T_IDE="Editor-IDE"

declare -A TAG_MAP=(
    # --- AI & Agent Workflow (The High Priority) ---
    ["$HOME/SuperClaude_Framework"]="$T_AI"
    ["$HOME/Claudix"]="$T_AI"
    ["$HOME/conductor"]="$T_AI"
    ["$HOME/.claude.json"]="AI-Config"
    ["$HOME/.gemini"]="AI-Config"
    ["$HOME/.agent"]="$T_AI"
    
    # --- Shell & Terminal (Set and Forget) ---
    ["$HOME/.zshrc"]="$T_ENV"
    ["$HOME/.oh-my-zsh"]="$T_ENV"
    ["$HOME/.p10k.zsh"]="$T_ENV"
    ["$HOME/powerlevel10k"]="$T_ENV"
    ["$HOME/.bash_history"]="$T_ENV"
    
    # --- Development ---
    ["$HOME/git"]="$T_DEV,⭐"
    ["$HOME/.vscode"]="$T_IDE"
    ["$HOME/.docker"]="$T_DEV"
    ["$HOME/.orbstack"]="$T_DEV,Container"
    ["$HOME/.gitconfig"]="Git-Config"
    
    # --- Academic ---
    ["$HOME/Zotero"]="$T_ACAD,⭐"
    ["$HOME/stata-mcp"]="$T_ACAD"
    
    # --- Standard macOS ---
    ["$HOME/Downloads"]="$T_STD"
    ["$HOME/Documents"]="$T_STD"
    ["$HOME/Desktop"]="$T_STD"
    ["$HOME/Pictures"]="$T_STD"
    ["$HOME/Music"]="$T_STD"
    ["$HOME/Movies"]="$T_STD"
    ["$HOME/Public"]="$T_STD"
)

# --- 3. Execution ---
echo "🚀 Applying semantic tags to your Home directory..."

for path in "${(@k)TAG_MAP}"; do
    if [[ -e "$path" ]]; then
        # Use -s to set tags (replaces existing tags for a clean state)
        "$TAG_BIN" -s "${TAG_MAP[$path]}" "$path"
        echo "✅ [${TAG_MAP[$path]}] -> $path"
    else
        # Silent skip for folders that don't exist on this specific machine
        continue
    fi
done

echo ""
echo "✨ Setup Complete!"
echo "💡 Pro Tip: Open Finder, look at the sidebar under 'Tags', and click '⭐' or 'AI-Workspace' to see the magic."
