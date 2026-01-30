#!/usr/bin/env zsh

# ==============================================================================
# Example Configuration: Creative Designer
# ==============================================================================
# This example is for graphic designers, UI/UX designers, and creative
# professionals who work with design tools, assets, and client projects.
# ==============================================================================

# --- Configuration Variables ---
T_DESIGN="Design-Work,⭐"
T_ENV="Terminal-Env"
T_STD="Standard-Folder"
T_ACTIVE="Active-Client,⭐"
T_ASSET="Design-Assets"

# --- Tag Mapping ---
declare -A TAG_MAP=(
    # === Active Client Projects ===
    ["$HOME/Projects/ClientA-Branding"]="$T_ACTIVE,Branding,Deadline"
    ["$HOME/Projects/ClientB-Website"]="$T_ACTIVE,Web-Design,UI/UX"
    ["$HOME/Projects/ClientC-App"]="$T_ACTIVE,Mobile-Design,App"
    
    # === Design Tools & Configs ===
    ["$HOME/Library/Application Support/Adobe"]="Adobe,Design-Tool"
    ["$HOME/.figmarc"]="Figma-Config"
    ["$HOME/.sketchrc"]="Sketch-Config"
    
    # === Design Assets ===
    ["$HOME/Design-Assets/Fonts"]="$T_ASSET,Typography,Fonts"
    ["$HOME/Design-Assets/Icons"]="$T_ASSET,Icons"
    ["$HOME/Design-Assets/Stock-Photos"]="$T_ASSET,Photography,Stock"
    ["$HOME/Design-Assets/Mockups"]="$T_ASSET,Mockups,Templates"
    ["$HOME/Design-Assets/Textures"]="$T_ASSET,Textures"
    ["$HOME/Design-Assets/Brushes"]="$T_ASSET,Brushes,Photoshop"
    
    # === Portfolio & Personal Work ===
    ["$HOME/Portfolio"]="Portfolio,Personal,⭐"
    ["$HOME/Personal-Projects"]="$T_DESIGN,Personal,Experimental"
    ["$HOME/Dribbble-Posts"]="Portfolio,Social-Media"
    
    # === Inspiration & References ===
    ["$HOME/Inspiration/UI-Examples"]="Inspiration,UI/UX"
    ["$HOME/Inspiration/Color-Palettes"]="Inspiration,Colors"
    ["$HOME/Inspiration/Typography"]="Inspiration,Typography"
    ["$HOME/Inspiration/Mood-Boards"]="Inspiration,Mood-Boards"
    
    # === Client Communication ===
    ["$HOME/Documents/Client-Briefs"]="$T_DESIGN,Client,Brief"
    ["$HOME/Documents/Proposals"]="$T_DESIGN,Client,Proposal"
    ["$HOME/Documents/Contracts"]="$T_DESIGN,Client,Legal"
    ["$HOME/Documents/Invoices"]="$T_DESIGN,Client,Finance"
    
    # === Archive ===
    ["$HOME/Archive/2023-Projects"]="Archive,2023,Completed"
    ["$HOME/Archive/2024-Projects"]="Archive,2024,Completed"
    
    # === Learning & Resources ===
    ["$HOME/Learning/Design-Courses"]="Learning,Courses"
    ["$HOME/Learning/Tutorials"]="Learning,Tutorials"
    
    # === Terminal & Development (for web designers) ===
    ["$HOME/.zshrc"]="$T_ENV,Shell-Config"
    ["$HOME/.oh-my-zsh"]="$T_ENV,ZSH"
    ["$HOME/git"]="Web-Dev,Code"
    
    # === Standard Folders ===
    ["$HOME/Downloads"]="$T_STD"
    ["$HOME/Documents"]="$T_STD,Design"
    ["$HOME/Desktop"]="$T_STD"
    ["$HOME/Pictures"]="$T_STD,Creative"
    ["$HOME/Music"]="$T_STD"
    ["$HOME/Movies"]="$T_STD,Video-Assets"
)

# --- Apply Tags ---
echo "🚀 Applying tags for Creative Designer setup..."

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
echo "✨ Designer Setup Complete!"
echo "💡 Open Finder → Tags sidebar to access your design workspace."
echo "🎨 Tip: Use 'Active-Client' to focus on current deadlines."
