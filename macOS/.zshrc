# p10k config source
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Terminal 中的 Report terminal type 改為 xterm-256color 
export TERM='xterm-256color'

# 載入 antigen
# zsh 的插件管理工具
source /usr/local/share/antigen/antigen.zsh

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

# zsh vim
# antigen bundle jeffreytse/zsh-vi-mode

# 套用 antigen 設定
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
DEFAULT_BROWSER="Google Chrome"

# ------- END -------

#  ---------------
# | alias setting |
#  ---------------

# alias to vscode
# terminal 下 "code ./xxx" 可以直接用 vscode 開啟檔案  
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

# alias to sublime 
# terminal 下 "subl ./xxx" 可以直接用 sublime 開啟檔案
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"

alias pn="pnpm"

# Change Directory
alias cdd="cd ~/desktop"
alias cdw="cd ~/downloads"
alias cdp="cd ~/desktop/projects"

# edit configs
alias ezsh="vim ~/.zshrc"
alias egit="vim ~/.gitconfig"
alias evim="vim ~/.config/nvim"
alias ehost="vim /etc/hosts"
alias czsh="code ~/.zshrc"
alias cgit="code ~/.gitconfig"
alias cvim="sudo code ~/.config/nvim"
alias chost="code /etc/hosts"
alias ls="exa --icons"

# open browser
alias defaultBrowserOpen='open -a $DEFAULT_BROWSER'
alias ghme='defaultBrowserOpen https://github.com/'

# git
alias gitcp='git branch --show-current | pbcopy'

git_fzf_checkout() {
 git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}

alias gitco="git_fzf_checkout"

git_fzf_remove() {
 git branch -D $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}


alias gitrm="git_fzf_remove"


git_push_upstream () {
  git push --set-upstream origin $(git branch --show-current)
}

alias gitpu="git_push_upstream"

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

alias gitsh="git_stash_fzf"


# vim
alias vim="nvim"

# ------- END -------


#  ---------------
# | other setting |
#  ---------------

# ------- END -------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

