HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

alias ls='ls --color=auto'

setopt AUTO_CD

autoload -Uz compinit
compinit
_comp_options+=(globdots)
zstyle ':completion:*' menu select
setopt MENU_COMPLETE

fpath=(/usr/share/zsh-theme-powerlevel10k/ $fpath)
autoload -Uz prompt_powerlevel10k_setup
prompt_powerlevel10k_setup

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
