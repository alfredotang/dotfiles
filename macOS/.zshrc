# p10k config source
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Turn Report terminal type to xterm-256color
export TERM='xterm-256color'

# Load the antigen
source /opt/homebrew/share/antigen/antigen.zsh

# Disable Homebrew Auto update
export HOMEBREW_NO_AUTO_UPDATE=1


#  -----------------
# | antigen setting |
#  -----------------

# oh my zsh
antigen use oh-my-zsh

# zsh theme
antigen theme romkatv/powerlevel10k

# nvm
antigen bundle lukechilds/zsh-nvm

# zsh auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# zsh syntax highlight
antigen bundle zsh-users/zsh-syntax-highlighting


# Apply antigen setting
antigen apply

# ------- END -------

#  ---------------
# | zsh vim config |
#  ---------------


# ------- END -------

#  ---------------
# | theme setting |
#  ---------------

ZSH_THEME="powerlevel10k/powerlevel10k"
# ------- END -------

#  ---------------
# |   variables   |
#  ---------------


# ------- END -------

#  ---------------
# | alias setting |
#  ---------------

# alias to vscode
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

# claude code
alias cc="claude"

# cursor code
alias cursor='/Applications/Cursor.app/Contents/Resources/app/bin/code'

# alias to sublime
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"

alias pn="pnpm"

# Change Directory
alias cdt="cd ~/desktop"
alias cdd="cd ~/downloads"
alias cdp="cd ~/Documents/projects"
alias cdpp="cd ~/Documents/projects/afu-playground"
alias cdoc="cd ~/Documents"
alias dad="rm -rf ~/downloads/*"
# Working Directory
alias cdw="cd ~/Documents/projects/gmi"

# edit configs
alias main_edit="code"
alias ezsh="main_edit ~/.zshrc"
alias egit="main_edit ~/.gitconfig"
alias evim="main_edit ~/.config/nvim"
alias ehost="main_edit /etc/hosts"
alias ls="lsd"

# claude code
alias cc="claude"

# zed
ZED_ALLOW_ROOT=true

# tmux
alias t="tmux"
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias tka="tmux kill-server"
alias tco="tmux_checkout"
tmux_checkout() {
  local session
  session=$(tmux ls 2>/dev/null | fzf --select-1 --exit-0 | cut -d: -f1)
  [ -n "$session" ] && tmux attach -t "$session"
}


# git
alias g="git"
alias gui="gitui"
alias gcp='echo -n `git branch --show-current` | pbcopy'


_git_fzf_select_branch() {
    local current_branch all_branches display selected

    current_branch=$(git branch --show-current)
    all_branches=$(git for-each-ref refs/heads/ --format='%(refname:short)')

    display=$(echo "$all_branches" | while read -r branch; do
      if [[ "$branch" == "$current_branch" ]]; then
        echo "$branch *"
      else
        echo "$branch"
      fi
    done)

    selected=$(echo "$display" | fzf)
    selected=$(echo "$selected" | awk '{print $1}')

    if [[ -z "$selected" ]]; then
      return 1
    fi

    echo "$selected"
}

git_fzf_checkout() {
    local branch
    branch=$(_git_fzf_select_branch) || return
    git checkout "$branch"
}

alias gco="git_fzf_checkout"

git_fzf_remove() {
    local branch
    branch=$(_git_fzf_select_branch) || return
    git branch -D "$branch"
}


alias grm="git_fzf_remove"


git_push_upstream () {
  git push --set-upstream origin $(git branch --show-current)
}

alias gpu="git_push_upstream"

git_stash_fzf() {
  stash_list=$(git stash list)
  selected_stash=$(echo "$stash_list" | fzf --reverse)
  if [ -z "$selected_stash" ]; then
    echo "No stash selected"
    exit 1
  fi
  stash_index=$(echo "$selected_stash" | awk '{print $1}' | tr -d ':')
  git stash apply $stash_index
}

alias gsh="git_stash_fzf"

git_stash_rm_fzf() {
  stash_list=$(git stash list)
  selected_stash=$(echo "$stash_list" | fzf --reverse)
  if [ -z "$selected_stash" ]; then
    echo "No stash selected"
    exit 1
  fi
  stash_index=$(echo "$selected_stash" | awk '{print $1}' | tr -d ':')
  git stash drop $stash_index
}

alias gshrm="git_stash_rm_fzf"

alias gfru="git_fetch_all_and_rebase_upstream_main"
git_fetch_all_and_rebase_upstream_main() {
  git fa
  git rebase upstream/main
}

alias gfr="git_fetch_all_and_rebase_origin_main"

git_fetch_all_and_rebase_origin_main() {
  git fa
  git rebase origin/main
}

# Helper function to format commit message from current branch name
_git_format_commit_message() {
  local input_type="${1:-Feat}"
  # Capitalize the first letter, lower the rest
  local type="$(echo "$input_type" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')"
  local current_branch=$(git branch --show-current)
  IFS='-' read -r project serial_number message_parts <<< "$current_branch"
  local message_body=${current_branch#"$project-$serial_number-"}
  # Convert kebab-case message_body to nocase (all lowercase, replace '-' and '_' with spaces)
  local nocase_message_body=$(echo "$message_body" | tr '[:upper:]' '[:lower:]' | sed -e 's/[-_]/ /g')
  echo "${project}-${serial_number}: [${type}] ${nocase_message_body}"
}

alias gcn="git_copy_branch_name"
git_copy_branch_name() {
  local current_branch=$(git branch --show-current)
  IFS='-' read -r project serial_number message_parts <<< "$current_branch"
  local message_body=${current_branch#"$project-$serial_number-"}
  # Convert kebab-case message_body to nocase (all lowercase, replace '-' and '_' with spaces)
  local nocase_message_body=$(echo "$message_body" | tr '[:upper:]' '[:lower:]' | sed -e 's/[-_]/ /g')
  printf "%s" "$nocase_message_body" | pbcopy
}

alias gcmn="git_copy_branch_name_and_commit"
git_copy_branch_name_and_commit() {
  local final_message=$(_git_format_commit_message "$1")
  git commit -m "$final_message" "$@"
}


# github
alias ghsw="gh_switch_account"
gh_switch_account() {
    local all_accounts active

    all_accounts=$(gh auth status 2>&1 \
      | awk '/Logged in to github\.com account/ {print $7}')

    active=$(gh auth status 2>&1 | awk '
      /Logged in to github\.com account/ { username = $7 }
      /Active account: true/ { print username }
    ')

    if [[ -z "$all_accounts" ]]; then
      echo "No GitHub accounts found."
      return 1
    fi

    local display selected
    display=$(echo "$all_accounts" | while read -r acc; do
      if [[ "$acc" == "$active" ]]; then
        echo "$acc *"
      else
        echo "$acc"
      fi
    done)

    selected=$(echo "$display" | fzf)
    selected=$(echo "$selected" | awk '{print $NF}' | tr -d '()')

    if [[ -z "$selected" ]]; then
      return 0
    elif [[ "$selected" == "$active" ]]; then
      echo "Already on: $active"
    else
      gh auth switch --user "$selected"
    fi
}


# ------- END -------


#  ---------------
# | other setting |
#  ---------------

# ------- END -------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
