# Terminal 中的 Report terminal type 改為 xterm-256color 
export TERM='xterm-256color'

# 載入 antigen
# zsh 的插件管理工具
source /usr/local/share/antigen/antigen.zsh

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

# 套用 antigen 設定
antigen apply

# ------- END -------


#  ---------------
# | theme setting |
#  ---------------

# POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# ------- END -------


#  ---------------
# | other setting |
#  ---------------

# fzf  source
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------- END -------