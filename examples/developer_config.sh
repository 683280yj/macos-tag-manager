#!/usr/bin/env zsh

# ==============================================================================
# Example Configuration: Full-Stack Developer
# ==============================================================================
# This example demonstrates a typical setup for a full-stack web developer
# who works with multiple projects, uses various dev tools, and manages
# multiple programming languages.
# ==============================================================================

# --- Configuration Variables ---
T_AI="AI-Workspace,⭐"
T_ENV="Terminal-Env"
T_DEV="Dev-Core"
T_STD="Standard-Folder"
T_IDE="Editor-IDE"
T_ACTIVE="Active-Project,⭐"

# --- Tag Mapping ---
declare -A TAG_MAP=(
    # === Active Development Projects ===
    ["$HOME/git/my-saas-app"]="$T_ACTIVE,Frontend,Backend"
    ["$HOME/git/mobile-app"]="$T_ACTIVE,React-Native,Mobile"
    ["$HOME/git/api-service"]="$T_ACTIVE,Backend,Node.js"
    
    # === Learning & Side Projects ===
    ["$HOME/git/learning-rust"]="$T_DEV,Learning,Rust"
    ["$HOME/git/portfolio-site"]="$T_DEV,Frontend,Personal"
    
    # === AI & Productivity ===
    ["$HOME/.cursor"]="$T_IDE,AI-Editor"
    ["$HOME/.claude.json"]="AI-Config"
    ["$HOME/.gemini"]="AI-Config"
    ["$HOME/.agent"]="$T_AI"
    ["$HOME/AI_Projects"]="$T_AI"
    
    # === Terminal & Shell ===
    ["$HOME/.zshrc"]="$T_ENV,Shell-Config"
    ["$HOME/.oh-my-zsh"]="$T_ENV,ZSH"
    ["$HOME/.p10k.zsh"]="$T_ENV,Prompt"
    ["$HOME/.bash_profile"]="$T_ENV,Shell-Config"
    ["$HOME/.bash_history"]="$T_ENV"
    
    # === Development Tools ===
    ["$HOME/Developer"]="$T_DEV,⭐"
    ["$HOME/git"]="$T_DEV,⭐"
    ["$HOME/.vscode"]="$T_IDE,VS-Code"
    ["$HOME/.docker"]="$T_DEV,Container,Docker"
    ["$HOME/.orbstack"]="$T_DEV,Container,OrbStack"
    ["$HOME/.npm"]="$T_DEV,Node.js,Package-Manager"
    ["$HOME/.cargo"]="$T_DEV,Rust,Package-Manager"
    
    # === Version Control ===
    ["$HOME/.gitconfig"]="Git-Config,⭐"
    ["$HOME/.git-credentials"]="Git-Config,Security"
    ["$HOME/.ssh"]="SSH-Config,Security"
    
    # === Database & Backend ===
    ["$HOME/.postgres"]="Database,Dev-Tool"
    ["$HOME/.redis"]="Database,Cache"
    ["$HOME/.mongodb"]="Database,NoSQL"
    
    # === Documentation & Notes ===
    ["$HOME/Documents/dev-notes"]="Documentation,Dev-Notes"
    ["$HOME/Documents/api-docs"]="Documentation,API"
    
    # === Standard Folders ===
    ["$HOME/Downloads"]="$T_STD"
    ["$HOME/Documents"]="$T_STD"
    ["$HOME/Desktop"]="$T_STD"
    ["$HOME/Pictures"]="$T_STD"
    ["$HOME/Music"]="$T_STD"
    ["$HOME/Movies"]="$T_STD"
)

# --- Apply Tags ---
echo "🚀 Applying tags for Full-Stack Developer setup..."

TAG_BIN=$(command -v tag)
if [[ -z "$TAG_BIN" ]]; then
    echo "❌ 'tag' utility not found. Please install: brew install tag"
    exit 1
fi

for item_path in "${(@k)TAG_MAP}"; do
    if [[ -e "$item_path" ]]; then
        "$TAG_BIN" -s "${TAG_MAP[$item_path]}" "$item_path"
        echo "✅ [${TAG_MAP[$item_path]}] -> $item_path"
    fi
done

echo ""
echo "✨ Developer Setup Complete!"
echo "💡 Open Finder → Tags sidebar to see your organized workspace."
