#!/usr/bin/env zsh

# ==============================================================================
# Example Configuration: Data Scientist / ML Engineer
# ==============================================================================
# This example is for data scientists and machine learning engineers who work
# with datasets, models, notebooks, and ML pipelines.
# ==============================================================================

# --- Configuration Variables ---
T_ML="Machine-Learning,⭐"
T_ENV="Terminal-Env"
T_DEV="Dev-Core"
T_STD="Standard-Folder"
T_ACTIVE="Active-Project,⭐"

# --- Tag Mapping ---
declare -A TAG_MAP=(
    # === Active ML Projects ===
    ["$HOME/Projects/nlp-model"]="$T_ACTIVE,NLP,Deep-Learning"
    ["$HOME/Projects/cv-detection"]="$T_ACTIVE,Computer-Vision,Detection"
    ["$HOME/Projects/recommendation-system"]="$T_ACTIVE,ML,Production"
    
    # === Datasets ===
    ["$HOME/Datasets/training-data"]="$T_ML,Dataset,Training"
    ["$HOME/Datasets/validation-data"]="$T_ML,Dataset,Validation"
    ["$HOME/Datasets/raw-data"]="$T_ML,Dataset,Raw"
    ["$HOME/Datasets/processed-data"]="$T_ML,Dataset,Processed,⭐"
    
    # === Models & Checkpoints ===
    ["$HOME/Models/pretrained"]="$T_ML,Pretrained,Models"
    ["$HOME/Models/checkpoints"]="$T_ML,Checkpoints,Training"
    ["$HOME/Models/production"]="$T_ML,Production,Deployed,⭐"
    
    # === Notebooks & Analysis ===
    ["$HOME/Notebooks/exploratory"]="$T_ML,Jupyter,EDA"
    ["$HOME/Notebooks/experiments"]="$T_ML,Jupyter,Experiments"
    ["$HOME/Notebooks/production"]="$T_ML,Jupyter,Production"
    
    # === Python Environment ===
    ["$HOME/.conda"]="$T_DEV,Python,Conda"
    ["$HOME/.jupyter"]="$T_DEV,Jupyter,Config"
    ["$HOME/.ipython"]="$T_DEV,IPython,Config"
    ["$HOME/.pip"]="$T_DEV,Python,Pip"
    ["$HOME/venv"]="$T_DEV,Python,Virtual-Env"
    
    # === Deep Learning Frameworks ===
    ["$HOME/.torch"]="$T_DEV,PyTorch,Config"
    ["$HOME/.tensorflow"]="$T_DEV,TensorFlow,Config"
    ["$HOME/.keras"]="$T_DEV,Keras,Config"
    
    # === MLOps & Tools ===
    ["$HOME/.docker"]="$T_DEV,Docker,MLOps"
    ["$HOME/.aws"]="$T_DEV,AWS,Cloud"
    ["$HOME/.mlflow"]="$T_ML,MLFlow,Tracking"
    ["$HOME/.wandb"]="$T_ML,WandB,Tracking"
    
    # === Papers & Research ===
    ["$HOME/Papers/read"]="Research,Papers,Read"
    ["$HOME/Papers/to-read"]="Research,Papers,Todo,⭐"
    ["$HOME/Papers/reproductions"]="Research,Papers,Implementation"
    
    # === Version Control ===
    ["$HOME/.gitconfig"]="Git-Config"
    ["$HOME/.git-lfs"]="Git-Config,LFS,Large-Files"
    ["$HOME/.ssh"]="SSH-Config,Security"
    
    # === Terminal & Shell ===
    ["$HOME/.zshrc"]="$T_ENV,Shell-Config"
    ["$HOME/.oh-my-zsh"]="$T_ENV,ZSH"
    ["$HOME/.p10k.zsh"]="$T_ENV,Prompt"
    
    # === Documentation ===
    ["$HOME/Documentation/model-specs"]="Documentation,Model-Specs"
    ["$HOME/Documentation/api-docs"]="Documentation,API"
    
    # === Standard Folders ===
    ["$HOME/Downloads"]="$T_STD"
    ["$HOME/Documents"]="$T_STD,ML"
    ["$HOME/Desktop"]="$T_STD"
    ["$HOME/Pictures"]="$T_STD"
)

# --- Apply Tags ---
echo "🚀 Applying tags for Data Scientist / ML Engineer setup..."

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
echo "✨ Data Science Setup Complete!"
echo "💡 Open Finder → Tags sidebar to access your ML workspace."
echo "🤖 Tip: Use 'Active-Project' tag to focus on current model development."
