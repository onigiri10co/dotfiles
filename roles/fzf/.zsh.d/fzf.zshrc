alias fzf='fzf-tmux'

# https://github.com/junegunn/fzf/wiki/Color-schemes#nord
FZF_COLOR_SCHEME='
--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'
export FZF_DEFAULT_OPTS="$FZF_COLOR_SCHEME -0 --inline-info --cycle" 

# Alt-C: https://github.com/junegunn/fzf/issues/164#issuecomment-581837757
bindkey "ç" fzf-cd-widget

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
