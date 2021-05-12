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
    echo -e "\n${COLOR_BLUE}info ${COLOR_NONE}canel"
    exit
}

function success {
    echo -e "\n ${COLOR_GREEN}success ${COLOR_NONE}$1"
}

function error {
    echo -e "\n${COLOR_RED}error ${COLOR_NONE}$1"
    exit
}


function print_step {
    echo -e "\n${COLOR_PURPLE}step $1/$len  ${COLOR_YELLOW}$2"
    echo -e "${COLOR_GRAY}=====================================${COLOR_NONE}"
}

# ctrl + c 後 執行
trap print_out SIGTERM SIGINT SIGHUP

# ========= install step function ===================

# 安裝 homebrew
function install_homebrew {
    title="Install Homebrew"
    print_step $1 "$title"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    success "$title"
}

# 使用 homebrew 安裝 app
function install_homebrew_dependencies {
    title="Install Homebrew dependencies"
    print_step $1 "$title"
    curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/master/macOS/Brewfile > /tmp/Brewfile  
    brew bundle --file /tmp/Brewfile  
    rm /tmp/Brewfile

    success "$title"
}

# 設定 zsh 
function configuare_zsh {
    title="configuare zsh"
    print_step $1 "$title"
    curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/master/macOS/.zshrc > ~/.zshrc
    success "$title"
}

# 設定 zsh thme - powerlevel10k
function configuare_powerlevel10k {
    title="configuare powerlevel10k"
    print_step $1 "$title"
    curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/master/macOS/.p10k.zsh > ~/.p10k.zsh

    success "$title"
}

# 將 zsh 設為 預設 shell
function setup_default_use_zsh {
    title="setup default use zsh"
    print_step $1 "$title"
    hsh -s /bin/zsh
    zsh

    success "$title"
}

# 安裝 步驟
install_step=("install_homebrew" "install_homebrew_dependencies" "configuare_zsh" "configuare_powerlevel10k" "setup_default_use_zsh")

len=${#install_step[*]}


# ================= main function ========================
for step in ${!install_step[@]}; do
    try
    (
        ${install_step[$step]} `expr $step + 1`
    )
    cache || {
        error "Error" SIGTERM SIGINT SIGHUP
    }
    
done
