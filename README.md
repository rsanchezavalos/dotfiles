# dotfiles

Personal configuration files for setting up a new machine.

## Features

- **Zsh** configuration with useful aliases and functions
- **Git** configuration with helpful aliases
- **Vim** and **Tmux** configurations
- **Brewfile** for essential tools (minimal, no project-specific packages)
- Smart **bootstrap script** that detects existing tools

## Quick Start

On a new machine:

```bash
git clone https://github.com/rsanchezavalos/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

The bootstrap script will:
1. Install Homebrew (if missing)
2. Install essential packages from Brewfile
3. Install Zplug (if missing)
4. Symlink all config files to your home directory (backs up existing files)

## Manual Setup

After bootstrapping, set your git user info:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Useful Aliases

**Navigation:**
- `mkd <dir>` - Create directory and cd into it
- `..`, `...`, `....` - Go up directories

**Git:**
- `gs` - Status
- `gb` - Branches sorted by most recent
- `amend` - Amend last commit
- `nuke` - Hard reset and clean
- `wip` - Quick "work in progress" commit

**Python:**
- `venv` - Create virtual environment
- `activate` - Activate venv in current directory

**Network:**
- `ip` - Get public IP
- `localip` - Get local IP

See [.zshrc](.zshrc) for full list.

## Philosophy

Keep it minimal - only include tools and configs you actually use. Project-specific dependencies should go in virtual environments (venv, nvm, etc.), not in the Brewfile.
