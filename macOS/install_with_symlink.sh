#!/usr/bin/env bash
# =========== colro variables =========
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

# ========= utils function ===========

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

# ========= Variables ===================
PATH_DOTFILES=~/documents/dotfiles

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

function clone_dotfiles_repo {
  title="clone dotfiles repo"
  print_step $1 "$title"
  git clone https://github.com/alfredotang/dotfiles.git "$PATH_DOTFILES"

  success "$title"
}

# Setting zsh
function configure_zsh {
  title="configure zsh"
  print_step $1 "$title"
  ln -sf "$PATH_DOTFILES/macOS/.p10k.zsh" ~/.p10k.zsh
  ln -sf "$PATH_DOTFILES/macOS/.zshrc" ~/.zshrc
  touch ~/.zshrc.local
  hsh -s /bin/zsh

  success "$title"
}

# Setting tmux
function configure_tmux {
  title="configure tmux"
  print_step $1 "$title"
  ln -sf "$PATH_DOTFILES/tmux/.tmux.conf" ~/.tmux.conf

  success "$title"
}

# setting git global config
function configure_gitconfig {
  title="configure gitconfig"
  print_step $1 "$title"
  ln -sf "$PATH_DOTFILES/git/.gitconfig" ~/.gitconfig

  success "$title"
}

# Setting neovim
function configure_neovim {
  title="configure neovim"
  print_step $1 "$title"
  [ -e ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
  [ -e ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak
  [ -e ~/.local/state/nvim ] && mv ~/.local/state/nvim ~/.local/state/nvim.bak
  [ -e ~/.cache/nvim ] && mv ~/.cache/nvim ~/.cache/nvim.bak

  ln -sf "$PATH_DOTFILES/nvim" ~/.config/nvim

  success "$title"
}

# Setting ghostty
function configure_ghostty {
  title="configure ghostty"
  print_step $1 "$title"
  ln -sf "$PATH_DOTFILES/macOS/config.ghostty" ~/Library/Application Support/com.mitchellh.ghostty/config.ghostty


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

# ================= main function ========================
{
  for step in ${!install_steps[@]}; do
    ${install_steps[$step]} $(expr $step + 1)
  done
} || {
  error "Error" SIGTERM SIGINT SIGHUP
}

install_steps=(
  "install_homebrew_dependencies"
  "clone_dotfiles_repo"
  "configure_zsh"
  "configure_gitconfig"
  "configure_tmux"
  "configure_neovim"
  "configure_ghostty"
  "disable_macos_press_and_hold"
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
