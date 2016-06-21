export GOPATH="$HOME/go/gopath"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/lib/jvm/java-8-openjdk/bin/"
export PATH="$PATH:~/.local/bin:~/bin/"
export WORK="~/go/work"
export VIMRUNTIME=/usr/share/vim/vim74
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
HISTSIZE=10000
SAVEHIST=10000
RPROMPT='$(jobs | sed -e "s:\s*[-+]\s*[a-z]*:$1:g" | tr "\n" " ")%f'
PROMPT='╭─$(parse-status)%F{3}%n@%m:%~%f
╰─$ ' #─>

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

autoload -U colors && colors
autoload -Uz compinit
compinit

bindkey -v
bindkey "^[[1~" beginning-of-line
bindkey "[1;5D" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "[1;5C" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

zstyle :compinstall filename '~/.zshrc'

stty -ixon
