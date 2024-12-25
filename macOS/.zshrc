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
alias ezsh="sudo code ~/.zshrc"
alias egit="sudo code ~/.gitconfig"
alias evim="sudo code ~/.config/nvim"
alias ehost="sudo code /etc/hosts"
alias ls="lsd"

# git
alias g="git"
alias gui="gitui"
alias gcp='echo -n `git branch --show-current` | pbcopy'

git_fzf_checkout() {
 git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}

alias gco="git_fzf_checkout"

git_fzf_remove() {
 git branch -D $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
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


# vim
alias vim="nvim"

# ------- END -------


#  ---------------
# | other setting |
#  ---------------

# ------- END -------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

