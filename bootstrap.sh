#!/usr/bin/env bash

# Dotfiles bootstrap script
# Installs essential tools and symlinks config files

set -e

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "========================================="
echo "Bootstrapping dotfiles from $DOTFILES_DIR"
echo "========================================="

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed"
fi

# Install packages from Brewfile
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "Installing packages from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
else
    echo "No Brewfile found, skipping package installation"
fi

# Install Zplug if not installed
if [ ! -d "$HOME/.zplug" ]; then
    echo "Installing Zplug..."
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
else
    echo "Zplug already installed"
fi

# Symlink dotfiles
echo "Symlinking dotfiles..."

# Function to safely symlink files
link_file() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        echo "  Symlink already exists: $dest"
    elif [ -f "$dest" ] || [ -d "$dest" ]; then
        echo "  Backing up existing file: $dest -> $dest.backup"
        mv "$dest" "$dest.backup"
        ln -s "$src" "$dest"
        echo "  Linked: $src -> $dest"
    else
        ln -s "$src" "$dest"
        echo "  Linked: $src -> $dest"
    fi
}

# Link individual dotfiles
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"
link_file "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

# Link .config directory if it exists
if [ -d "$DOTFILES_DIR/.config" ]; then
    if [ ! -d "$HOME/.config" ]; then
        mkdir -p "$HOME/.config"
    fi
    link_file "$DOTFILES_DIR/.config" "$HOME/.config/dotfiles"
fi

# Set up git user info
echo ""
echo "========================================="
echo "Don't forget to set your git user info:"
echo "  git config --global user.name \"Your Name\""
echo "  git config --global user.email \"your.email@example.com\""
echo "========================================="
echo ""
echo "Bootstrap complete! Restart your terminal or run: source ~/.zshrc"
