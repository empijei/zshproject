export GOPATH="$HOME/go/gopath"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/lib/jvm/java-8-openjdk/bin/"
export PATH="$PATH:~/.local/bin:~/bin/"
export WORK="~/go/work"
export VIMRUNTIME=/usr/share/vim/vim80
export EDITOR=/usr/bin/vim
export PYTHONSTARTUP=".pythonstartup.py"
export BROWSER=/usr/bin/chromium
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
RPROMPT='$(jobs | cut -d" " -f1,6 | tr "\n" " ")%f'
PROMPT='╭─$(parse-status)${ZSH_MODE}%F{3}%n@%m:%~%f$(git-stuff)
╰─→ ' #─>

parse-status(){
	local LAST_EXIT_CODE=$?
	case $LAST_EXIT_CODE in
		0)
			echo "%F{2} (OK) "
			;;
		148)
			echo "%F{4} (SUSPENDED) "
			;;
		130)
			echo "%F{1} (INTERRUPTED) "
			;;
		*)
			echo "%F{1} (ERROR $LAST_EXIT_CODE) "
			;;
	esac
}

git-stuff(){
	git rev-parse --is-inside-work-tree >&/dev/null&&
		echo &&
		echo -n "╞  %F{4}git:("$(git rev-parse --abbrev-ref HEAD 2>/dev/null)") " &&
	if [[ -z $(git status -s 2>/dev/null) ]] ;
	then
		echo -n "%F{2}✓%f"
	else
		echo -n "%F{1}✗%f"
	fi
}

function zle-line-init zle-keymap-select {
local ZSH_MODE=""
case $KEYMAP in
	vicmd)
		ZSH_MODE="%F{1}[NOR] %f"
		;;
	main|viins)
		ZSH_MODE="%F{4}[INS] %f"
		;;
esac
zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

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

