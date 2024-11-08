#!/usr/bin/env bash

# Installer for pyron

set -e

# Configuration
INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="pyron.sh"
GITHUB_RAW="https://raw.githubusercontent.com/cpfiffer/pyron/main"

# Create installation directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download the script
echo "Downloading pyron..."
curl -fsSL "$GITHUB_RAW/pyron.sh" -o "$INSTALL_DIR/$SCRIPT_NAME" || {
    echo "Error: Failed to download pyron.sh" >&2
    exit 1
}

# Make the script executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Detect shell and add source line to appropriate rc file
add_source_line() {
    local rc_file="$1"
    local source_line="source $INSTALL_DIR/$SCRIPT_NAME"
    
    if ! grep -q "^$source_line" "$rc_file" 2>/dev/null; then
        echo "" >> "$rc_file"
        echo "# Added by pyron installer" >> "$rc_file"
        echo "$source_line" >> "$rc_file"
        echo "Added source line to $rc_file"
    else
        echo "Source line already exists in $rc_file"
    fi
}

# Add to appropriate shell configuration files
if [ -f "$HOME/.zshrc" ]; then
    add_source_line "$HOME/.zshrc"
fi

if [ -f "$HOME/.bashrc" ]; then
    add_source_line "$HOME/.bashrc"
fi

echo "Installation complete! Please restart your shell or run:"
echo "  source $INSTALL_DIR/$SCRIPT_NAME"
