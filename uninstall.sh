#!/bin/bash

# Tim Breeze Uninstallation Script
# Removes Tim Breeze aliases from your shell configuration

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_FILE="$SCRIPT_DIR/tim_breeze_aliases.sh"
SOURCE_LINE="source \"$ALIASES_FILE\""

echo "Uninstalling Tim Breeze shell aliases..."

# Function to remove Tim Breeze configuration from RC file
remove_from_rc() {
    local rc_file="$1"
    local file_name="$(basename "$rc_file")"
    
    if [ -f "$rc_file" ]; then
        if grep -Fq "$SOURCE_LINE" "$rc_file"; then
            # Create a temporary file without the Tim Breeze lines
            grep -v "# Tim Breeze Git Aliases" "$rc_file" | grep -Fv "$SOURCE_LINE" > "${rc_file}.tmp"
            mv "${rc_file}.tmp" "$rc_file"
            echo "✓ Removed Tim Breeze from $file_name"
        else
            echo "ℹ️  Tim Breeze not found in $file_name"
        fi
    else
        echo "ℹ️  $file_name does not exist"
    fi
}

# Remove from common shell RC files
remove_from_rc "$HOME/.zshrc"
remove_from_rc "$HOME/.bashrc"
remove_from_rc "$HOME/.bash_profile"

# Unset all Tim Breeze aliases from current session
echo ""
echo "Removing aliases from current shell session..."

# List of all Tim Breeze aliases
aliases_to_remove=(
    "gs" "ga" "gaa" "gap" "gau"
    "gc" "gca" "gcm" "gcmh" "gch"
    "gco" "gb" "gba" "gbm" "gbd" "gbD"
    "gd" "gdc" "gdw"
    "gl" "gla" "gll"
    "gf" "gfa" "gpl" "gplr" "gps" "gpsf"
    "gr" "grh" "grsl"
    "grb" "grbi" "grbc" "grba"
    "gm" "gmnff" "gmff"
    "gcl" "gcp" "gst" "gss" "gce" "gcef" "gsh" "gsf"
    "unstage" "last" "visual" "git-aliases"
)

# Unset each alias in current session
for alias_name in "${aliases_to_remove[@]}"; do
    unalias "$alias_name" 2>/dev/null
done

echo "✓ Removed aliases from current shell session"
echo ""
echo "🗑️  Tim Breeze uninstallation complete!"
echo ""
echo "The aliases have been removed from your shell configuration files."
echo "To complete the removal, either:"
echo "  - Restart your terminal, or"
echo "  - Run: exec \$SHELL"
echo ""
echo "Note: Any terminals that were already open will still have the aliases"
echo "until they are restarted."