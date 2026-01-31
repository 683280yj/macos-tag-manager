#!/usr/bin/env zsh

# ==============================================================================
# Example Configuration: Academic Researcher
# ==============================================================================
# This example is for PhD students, researchers, and academics who manage
# papers, data analysis, literature reviews, and research projects.
# ==============================================================================

# --- Configuration Variables ---
T_ACAD="Research-Acad,⭐"
T_ENV="Terminal-Env"
T_DEV="Dev-Core"
T_STD="Standard-Folder"
T_IDE="Editor-IDE"
T_ACTIVE="Active-Research,⭐"

# --- Tag Mapping ---
declare -A TAG_MAP=(
    # === Active Research Projects ===
    ["$HOME/Research/dissertation"]="$T_ACTIVE,PhD,Writing"
    ["$HOME/Research/paper-submission"]="$T_ACTIVE,Publication,Deadline"
    ["$HOME/Research/current-experiments"]="$T_ACTIVE,Experiments,Data"
    
    # === Literature & References ===
    ["$HOME/Zotero"]="$T_ACAD,Literature,⭐"
    ["$HOME/Documents/Papers"]="$T_ACAD,Literature"
    ["$HOME/Documents/Reading-List"]="$T_ACAD,Literature,Todo"
    ["$HOME/Downloads/papers"]="$T_ACAD,Literature,Downloaded"
    
    # === Data Analysis ===
    ["$HOME/stata-mcp"]="$T_ACAD,Statistics,Tool"
    ["$HOME/R-Projects"]="$T_ACAD,Statistics,R"
    ["$HOME/Python-Analysis"]="$T_ACAD,Data-Science,Python"
    ["$HOME/Data"]="$T_ACAD,Dataset,⭐"
    
    # === Writing & LaTeX ===
    ["$HOME/LaTeX-Projects"]="$T_ACAD,Writing,LaTeX"
    ["$HOME/.texlive"]="$T_IDE,LaTeX-Config"
    ["$HOME/Documents/Drafts"]="$T_ACAD,Writing,Draft"
    ["$HOME/Documents/Publications"]="$T_ACAD,Published"
    
    # === Conference & Presentations ===
    ["$HOME/Documents/Conferences"]="$T_ACAD,Conference,Presentation"
    ["$HOME/Documents/Talks"]="$T_ACAD,Presentation"
    ["$HOME/Documents/Posters"]="$T_ACAD,Conference,Poster"
    
    # === Collaboration ===
    ["$HOME/Shared-Research"]="$T_ACAD,Collaboration"
    ["$HOME/Lab-Resources"]="$T_ACAD,Lab,Resources"
    
    # === Development Tools (for research computing) ===
    ["$HOME/.jupyter"]="$T_DEV,Jupyter,Python"
    ["$HOME/.conda"]="$T_DEV,Python,Package-Manager"
    ["$HOME/.Rprofile"]="$T_DEV,R-Config"
    
    # === Terminal & Shell ===
    ["$HOME/.zshrc"]="$T_ENV,Shell-Config"
    ["$HOME/.oh-my-zsh"]="$T_ENV,ZSH"
    ["$HOME/.p10k.zsh"]="$T_ENV,Prompt"
    
    # === Version Control (for research projects) ===
    ["$HOME/.gitconfig"]="Git-Config"
    ["$HOME/.ssh"]="SSH-Config,HPC-Access"
    
    # === Backup & Archive ===
    ["$HOME/Archive/old-projects"]="Archive,Old-Research"
    ["$HOME/Backup"]="Archive,Backup"
    
    # === Standard Folders ===
    ["$HOME/Downloads"]="$T_STD"
    ["$HOME/Documents"]="$T_STD,Academic"
    ["$HOME/Desktop"]="$T_STD"
    ["$HOME/Pictures"]="$T_STD"
    ["$HOME/Music"]="$T_STD"
)

# --- Apply Tags ---
echo "🚀 Applying tags for Academic Researcher setup..."

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
echo "✨ Academic Setup Complete!"
echo "💡 Open Finder → Tags sidebar to access your research materials."
echo "📚 Tip: Use 'Active-Research' tag to focus on current projects."
