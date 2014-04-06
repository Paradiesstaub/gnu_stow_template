# Set up the prompt
# https://wiki.archlinux.org/index.php/Zsh
autoload -U colors && colors
setopt PROMPT_SUBST

function get_prompt() {
    if [[ $UID -eq 0 ]]; then # check if user is root
	    echo -e "\u21AF"
    else
	    echo -e "\u276D"
    fi
}

PROMPT='%n@%m %~
$(get_prompt) '

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# re-enable C-[arrow] & M-[arrow] gnome-terminal keys
bindkey ';3D' emacs-backward-word
bindkey ';3C' emacs-forward-word
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word

alias reload='clear; source ~/.zshrc'

alias ..='cd ..'
alias ...="cd ../.."

alias l='clear ; ls -CF'
alias ll='clear ; ls -alFh --ignore="\." --ignore="\.\."'
alias ls='ls --color=auto'
alias la='clear ; ls -A'
alias s='ack-grep -C 3 --ignore-case'
alias g='git'
alias shutdown='sudo shutdown -h now'

alias grep='grep --color=auto'
alias kernel='dpkg --get-selections | grep "linux-image-[[:digit:]].*" | tr "\t" ";" | cut -d ";" -f1'

alias u='sudo apt-get update && sudo apt-get dist-upgrade'
alias au='sudo apt-get update'
alias ad='sudo apt-get dist-upgrade'
alias as='apt-cache search'
alias ai='sudo apt-get install'
alias ar='sudo apt-get remove'
alias ap='sudo apt-get purge'
alias ashow='apt-cache show'

alias myip='wget -qO- http://ipecho.net/plain ; echo' #'curl ifconfig.me'
alias n='emacs ~/.note.txt'
alias e='emacs'

alias dt='clear; cd /tmp'
alias __='sudo -i'

alias -g G='| grep -i' # ignore case
alias -g L='| less --chop-long-lines'
alias -g C='| wc -l'
alias -g H='| head -n 25'
alias -g EDN='2>/dev/null'

alias -s xz='tar -Jvxf'
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'

alias -s zip='unzip'
alias -s txt='less'

# create & cd into dir
md() { mkdir -p "$@" && cd "$@"; }

# executed after dir change
function chpwd() {
    clear
    SIZE_W=$(echo ${$(stty size)[2]})

    # exec ls if terminal width is >= 100
    if [ $SIZE_W -ge 100 ]; then
	    ls -CF
    fi
}

# o open file(s) in Emacs in read-only mode
function o() {
    emacs "$@" --eval '(setq buffer-read-only t)'
}
