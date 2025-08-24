#!/bin/bash

# Tim Breeze Installation Script
# Adds Tim Breeze aliases to your shell configuration

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_FILE="$SCRIPT_DIR/tim_breeze_aliases.sh"
SOURCE_LINE="source \"$ALIASES_FILE\""

echo "Installing Tim Breeze shell aliases..."

# Function to add source line to a file if it doesn't already exist
add_source_line() {
    local rc_file="$1"
    local file_name="$(basename "$rc_file")"
    
    if [ -f "$rc_file" ]; then
        if grep -Fq "$SOURCE_LINE" "$rc_file"; then
            echo "✓ Tim Breeze already configured in $file_name"
        else
            echo "" >> "$rc_file"
            echo "# Tim Breeze Git Aliases" >> "$rc_file"
            echo "$SOURCE_LINE" >> "$rc_file"
            echo "✓ Added Tim Breeze to $file_name"
        fi
    else
        echo "# Tim Breeze Git Aliases" > "$rc_file"
        echo "$SOURCE_LINE" >> "$rc_file"
        echo "✓ Created $file_name with Tim Breeze aliases"
    fi
}

# Interactive shell selection
echo ""
echo "Which shell configuration would you like to use?"
echo ""
echo "1) Zsh (.zshrc)"
echo "2) Bash (.bashrc)"
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "3) Bash (.bash_profile) - macOS default"
fi
echo "4) Auto-detect (current behavior)"
echo ""
read -p "Please select an option (1-4): " choice

case $choice in
    1)
        echo "Selected: Zsh (.zshrc)"
        add_source_line "$HOME/.zshrc"
        ;;
    2)
        echo "Selected: Bash (.bashrc)"
        add_source_line "$HOME/.bashrc"
        ;;
    3)
        if [[ "$OSTYPE" == "darwin"* ]]; then
            echo "Selected: Bash (.bash_profile)"
            add_source_line "$HOME/.bash_profile"
        else
            echo "❌ .bash_profile option is only available on macOS"
            echo "Falling back to auto-detect..."
            # Auto-detect logic for fallback
            if [ -n "$ZSH_VERSION" ]; then
                echo "Detected: Zsh"
                add_source_line "$HOME/.zshrc"
            elif [ -n "$BASH_VERSION" ]; then
                echo "Detected: Bash"
                add_source_line "$HOME/.bashrc"
            else
                echo "⚠️  Could not detect shell type. Adding to multiple files..."
                add_source_line "$HOME/.zshrc"
                add_source_line "$HOME/.bashrc"
            fi
        fi
        ;;
    4|*)
        echo "Selected: Auto-detect"
        # Auto-detect logic
        if [ -n "$ZSH_VERSION" ]; then
            echo "Detected: Zsh"
            add_source_line "$HOME/.zshrc"
        elif [ -n "$BASH_VERSION" ]; then
            echo "Detected: Bash"
            if [[ "$OSTYPE" == "darwin"* ]]; then
                add_source_line "$HOME/.bash_profile"
            else
                add_source_line "$HOME/.bashrc"
            fi
        else
            echo "⚠️  Could not detect shell type. Adding to multiple files..."
            add_source_line "$HOME/.zshrc"
            if [[ "$OSTYPE" == "darwin"* ]]; then
                add_source_line "$HOME/.bash_profile"
            else
                add_source_line "$HOME/.bashrc"
            fi
        fi
        ;;
esac

echo ""
echo "🎉 Tim Breeze installation complete!"
echo ""
echo "To start using the aliases immediately, run:"
echo "  source \"$ALIASES_FILE\""
echo ""
echo "Or restart your terminal to load them automatically."
echo ""
echo "Available shortcuts:"
echo "  gs    - git status"
echo "  ga    - git add"
echo "  gc    - git commit"
echo "  gco   - git checkout"
echo "  gd    - git diff"
echo "  gl    - git log"
echo "  gps   - git push"
echo "  gpl   - git pull"
echo "  And many more!"
echo ""
echo "Run 'git-aliases' to see all available aliases."