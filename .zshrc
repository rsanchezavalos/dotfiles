print -r -- "SOURCED: ~/.zshrc" >> /tmp/zsh_sourced.log

# 1. Initialize Zplug
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

# 2. Oh My Zsh Libraries & Plugins (Managed via Zplug)
# "lib/*" loads standard OMZ defaults (history, completion, keybindings)
zplug "lib/*", from:oh-my-zsh
# "plugins/git" loads the git plugin (provides 'gs', 'ga', 'gc' aliases)
zplug "plugins/git", from:oh-my-zsh

# 3. Theme (Pure)
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# 4. Load Plugins
# This must run AFTER defining the plugins above
zplug load

# 5. Install plugins if missing (Auto-installs the git plugin on next run)
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# 6. User Configuration (NVM, Java, etc.)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

#########################################
# Useful Aliases
#########################################

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Directory listing
alias ll="ls -lah"
alias la="ls -A"

# Git shortcuts
alias g="git"
alias gs="git status"
alias gd="git diff"
alias gb="git branch --sort=-committerdate"  # Most recent branches first
alias gco="git checkout"
alias amend="git add . && git commit --amend --no-edit"
alias nuke="git clean -df && git reset --hard"
alias wip="git add . && git commit -m 'wip'"gvgvgv

# Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias flushdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
gv
# Python
alias py="python3"
alias venv="python3 -m venv venv"
alias activate="source venv/bin/activate"

# Clipboard
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"

# Reload shell
alias reload="source ~/.zshrc"

#########################################
# Useful Functions
#########################################

# Create directory and cd into it
mkd() {
    mkdir -p "$@" && cd "$_"
}

# cd to the path of the front Finder window
cdf() {
    target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# Get file/directory size
fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* ./*
    fi
}

# Start HTTP server in current directory
server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python3 -m http.server "$port"
}
