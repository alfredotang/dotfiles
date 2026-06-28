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


# Install APP by homebrew
function install_homebrew_dependencies {
	title="Install Homebrew dependencies"
	print_step $1 "$title"
	curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/main/macOS/Brewfile >/tmp/Brewfile
	brew bundle --file /tmp/Brewfile
	rm /tmp/Brewfile

	success "$title"
}

# Setting zsh
function configuare_zsh {
	title="configuare zsh"
	print_step $1 "$title"
	curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/main/macOS/.p10k.zsh >~/.p10k.zsh
	curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/main/macOS/.zshrc >~/.zshrc
	hsh -s /bin/zsh

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

# Setting tmux
function configure_tmux {
	title="configure tmux"
	print_step $1 "$title"
	curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/main/tmux/.tmux.conf >~/.tmux.conf

	success "$title"
}

# setting git global config
function setting_git_global_config {
	title="setting git global config"
	print_step $1 "$title"
	curl -fsSL https://raw.githubusercontent.com/alfredotang/dotfiles/main/git/.gitconfig >~/.gitconfig

	success "$title"
}

install_steps=(
	"install_homebrew_dependencies"
	"configuare_zsh"
	"disable_macos_press_and_hold"
	"setting_git_global_config"
	"configure_tmux"
)

len=${#install_steps[*]}

# ================= main function ========================
{
	for step in ${!install_steps[@]}; do
		${install_steps[$step]} $(expr $step + 1)
	done
} || {
	error "Error" SIGTERM SIGINT SIGHUP
}
