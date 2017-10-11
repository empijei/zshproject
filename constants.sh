export GOPATH="$HOME/go/gopath"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/lib/jvm/java-8-openjdk/bin/"
export PATH="$PATH:~/.local/bin:~/bin/"
export WORK="~/go/work"
export VIMRUNTIME=/usr/share/vim/vim80
export EDITOR=/usr/bin/vim
export PYTHONSTARTUP=".pythonstartup.py"
export BROWSER=/usr/bin/chromium
export LC_CTYPE=en_US.UTF-8
#export TERMINAL="terminator"

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt autocd extendedglob
setopt PROMPT_SUBST
setopt CORRECT 
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME

#Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000

# 
RPROMPT='$(jobs | sed -e "s:\s*[-+]\s*[a-z]*:$1:g" | tr "\n" " ")%f'
PROMPT='
$(parse-status)$(print-prompt)$(git-stuff)
$(parse-mode)'

print-prompt(){
local STATIC='%n@%m:%~'
echo $STATIC
}

parse-status(){
local LAST_EXIT_CODE=$?
local RESET="\033[0;30;43m"
case $LAST_EXIT_CODE in
	0)
		echo "\033[0;30;42m (OK) \033[0;32;43m$RESET"
		;;
	148)
		echo "\033[0;30;46m (SUSPENDED) \033[0;36;43m$RESET"
		;;
	130)
		echo "\033[0;37;41m (INTERRUPTED) \033[0;31;43m$RESET"
		;;
	*)
		echo "\033[0;37;41m (ERROR $LAST_EXIT_CODE) \033[0;31;43m$RESET"
		;;
esac
}


function zle-line-init zle-keymap-select {
zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

parse-mode(){
local MODE=""
local RESET="%0{\033[0;37m%}"
case $KEYMAP in
	vicmd)
		MODE="%0{\033[0;30;42m%} NORMAL %1{\033[0;32m%}$RESET "
		;;
	main|viins)
		MODE="%0{\033[0;30;47m%} INSERT %1{\033[0;37m%}$RESET "
		;;
esac
echo $MODE
}

git-stuff(){
git rev-parse --is-inside-work-tree >&/dev/null&&
	echo -n "%3{\033[0;33;46m\033[0;30;46m %} $(git rev-parse --abbrev-ref HEAD 2>/dev/null) " &&
	if [[ -z $(git status -s 2>/dev/null) ]] ;
	then
		echo -n "✓"
	else
		echo -n "✗"
	fi && echo -n "%1{\033[0;37m\033[0;36m%}" || echo -n "\033[0;33m"
}

autoload -U colors && colors
autoload -Uz compinit
compinit

stty -ixon

bindkey -v
bindkey "^[[1~" beginning-of-line
bindkey "[1;5D" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "[1;5C" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^U' backward-kill-line
bindkey '^Y' yank

zstyle :compinstall filename '~/.zshrc'

