##########################################################################################################
## zsh documents
# % man zsh          :List of zsh manuals and zsh overview
# % man zshmisc      :Script syntax, how to write redirects and pipes, list of special functions, etc. 
# % man zshexpn      :Notation of glob and variable expansion 
# % man zshparam     :List of special variables and notation of suffix expansion of variables  
# % man zshoptions   :List of options that can be set with setopt  
# % man zshbuiltins  :List of built-in commands 
# % bindkey -L       :Examine key binding
#
## display color
# % for c in {000..255}; do echo -n "\e[38;5;${c}m $c"; [ $(($c%16)) -eq 15 ] && echo; done
#
## order in zsh config is loaded
# zshenv -> zprofile -> zshrc -> zlogin
# For each, read global(/etc/zsh*) and then overwrite with local(~/.zsh*)). 
# if $ZDOTDIR is set, zsh* under that directory will be loaded(default: $HOME).
##########################################################################################################
# Not duplicate registration
typeset -U path PATH cdpath fpath manpath MANPATH

# NOTE: set fpath before compinit
fpath+=~/.zsh.d/completion

# Env
export PATH="$HOME/bin:/usr/local/bin:/sbin:/usr/sbin/:$PATH"

# Bindkey
bindkey -v                                             # vi keybind 
bindkey "^[[Z" reverse-menu-complete                   # shift-tab reverse
stty stop undef                                        # disable <C-s>: Stop screen output. 
stty start undef                                       # disable <C-q>: Restart screen output that is stopped.

# Base
autoload -Uz compinit && compinit                      # auto-completion: on
autoload -Uz colors && colors                          # colors: on
setopt no_tify                                         # Notify as soon as the background job is over.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'    # Match to uppercase lowercase conversion (However, distinguish when inputting capital letters)
zstyle ':completion:*:default' menu select=1           # Press <Tab>, you can select the path name from candidates. 
zstyle ':completion:*:sudo:*' command-path $path       # To enable the completion with sudo command

# Editor
export EDITOR=vim

# History
##########################################################################################################
# history command same as $ fc -l
# $ history -i            Show execution date and time
# $ history -D            Show the time spent executing
# $ history <fr> <to>     Specify the range and show it
#   e.g. history 1 5      Show from 1st to 5th 
#   e.g. history -5       Show the last 5 
#   e.g. history 1        Show from 1st (= show all) 
#   e.g. history -10 -5   Show from the tenth most recent to the last five most recent history 
##########################################################################################################
setopt share_history                                   # Share history
export HISTFILE=~/.zsh_history                         # Save history file 
export HISTSIZE=10000                                  # Number of history items to store in memory
export SAVEHIST=10000                                  # Number of records to be saved in history file
setopt hist_ignore_all_dups                            # Duplicate commands delete the old one
setopt hist_ignore_space                               # Beginning starts with a space, do not add it to history.
setopt hist_no_store                                   # Do not register the history command in the history.

# Prompt
# TODO: prompt 修正。常に、% だけで良い。current dir とか、git branch は別で表示したい。 tmux, vim 両方で同じぐらいの位置が良い。左下。常に目が触れるところ。
PROMPT="%F{004}%%%f "
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true        # Enable %c,%u formatting. If there are uncommitted files in the repository, the string is stored.
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"       # only git add files
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"        # not git add files
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"     # set $vcs_info_msg_0_
zstyle ':vcs_info:*' actionformats '(%b|%a)'           # This format is displayed at merge conflict.
precmd () { vcs_info }
PROMPT='${vcs_info_msg_0_}'$PROMPT 

# Command options
export LESS='-iMR'

# Load zsh config(see also: $HOME/bin/zsh-build)
zsh-build
test -r ~/.zsh.d/.zshrc && source ~/.zsh.d/.zshrc
zsh-completion

