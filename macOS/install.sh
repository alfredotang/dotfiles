#!/usr/bin/env bash

# =========== colro variables =========
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

# ========= utilites function ===========

function print_out {
    printf "\n${COLOR_BLUE}info ${COLOR_NONE}canel\n"
    exit
}

function success {
    printf "\n ${COLOR_GREEN}success ${COLOR_NONE}$1\n"
}

function error {
    printf "\n${COLOR_RED}error ${COLOR_NONE}$1\n"
    exit
}


function print_step {
    printf "\n${COLOR_PURPLE}step $1/$len  ${COLOR_YELLOW}$2"
    printf "\n${COLOR_GRAY}=====================================${COLOR_NONE}\n"
}

trap print_out SIGTERM SIGINT SIGHUP

# ========= install step function ===================

# Install homebrew
function install_homebrew {
    title="Install Homebrew"
    print_step $1 "$title"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    success "$title"
}

# Install APP by homebrew
function install_homebrew_dependencies {
    title="Install Homebrew dependencies"
    print_step $1 "$title"
    curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/master/macOS/Brewfile > /tmp/Brewfile  
    brew bundle --file /tmp/Brewfile  
    rm /tmp/Brewfile

    success "$title"
}

# Setting zsh 
function configuare_zsh {
    title="configuare zsh"
    print_step $1 "$title"
    curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/master/macOS/.zshrc > ~/.zshrc

    success "$title"
}

# Setting zsh theme by powerlevel10k
function configuare_powerlevel10k {
    title="configuare powerlevel10k"
    print_step $1 "$title"
    curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/master/macOS/.p10k.zsh > ~/.p10k.zsh

    success "$title"
}

# Setup zsh to deafault shell
function setup_default_use_zsh {
    title="setup default use zsh"
    print_step $1 "$title"
    hsh -s /bin/zsh
    zsh

    success "$title"
}

# To enable global key-repeat
# If you're using vim's j k l h as your cursor movement keys
# not having this setting enabled could be problematic when navigating.
function disable_macos_press_and_hold {
    title="enable global key-repeat"
    print_step $1 "$title"
    defaults write -g ApplePressAndHoldEnabled -bool false

    success "$title"
}

# setting git global config
function setting_git_global_config {
    title="setting git global config"
    print_step $1 "$title"
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.cm "commit -m"
    git config --global alias.st status
    git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
    git config --global core.ignorecase false

    success "$title"
}

install_steps=(
    "install_homebrew" 
    "install_homebrew_dependencies" 
    "configuare_zsh" 
    "configuare_powerlevel10k" 
    "setup_default_use_zsh" 
    "disable_macos_press_and_hold" 
    "setting_git_global_config"
)

len=${#install_steps[*]}


# ================= main function ========================
{
    for step in ${!install_steps[@]}; do
        ${install_steps[$step]} `expr $step + 1`
    done
} || {
    error "Error" SIGTERM SIGINT SIGHUP
}
