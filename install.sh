#!/bin/bash

# This script installs and sets up the alias for avrmenu.sh

# Assuming your script is named your_script.sh, replace it with your actual script name
SCRIPT_NAME="avrmenu.sh"
ALIAS_NAME="avrmenu"

# Check if script is executable
chmod +x "$SCRIPT_NAME"

# Determine user's shell (bash or zsh
SHELL_PROFILE="$HOME/.bashrc"  # Default to bash

if [ -n "$ZSH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.zshrc"
fi

# Add alias to user's profile
echo -e "\n# Alias for custom tool" >> "$SHELL_PROFILE"
echo "alias $ALIAS_NAME=\"$(pwd)/$SCRIPT_NAME\"" >> "$SHELL_PROFILE"
#echo " kconfig-mconf  $(pwd)\KConfig" 
sed -i "2i\ kconfig-mconf  $(pwd)\/KConfig" avrmenu.sh

# Source the profile to apply changes immediately
source "$SHELL_PROFILE"

echo "Installation complete. Alias '$ALIAS_NAME' created for '$SCRIPT_NAME'."
echo "You can now use '$ALIAS_NAME' to run your script."

