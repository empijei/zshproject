alias "cd.."="cd ../"
alias "cd../"="cd ../"
alias -g "..."="../.."
alias -g "...."="../../.."
alias -g "..../"="../../../"
alias -g ".../"="../../"
alias -g egp="| egrep"
alias -g gp="| grep"
alias -g §="| while read line; do; "
alias -g ç="; done"
alias -s csv=vim
alias -s go=vim
alias -s lua=vim
alias -s pdf=evince
alias -s tex=vim
alias -s txt=vim
alias aj="autojump"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias aweconfig="vim $HOME/.config/awesome/rc.lua"
alias ca="/bin/cat"
alias cat="lolcat"
alias cd="pushd"
alias cp="cp -avurf"
alias ct="/bin/cat"
alias deflate="inflate -d -l 9"
alias dropbox="dropbox-cli"
alias e="vim -p"
alias egrep='grep -E --color=auto'
alias ehco="echo"
alias etodo="vim $HOME/Dropbox/TODO"
alias fgrep='grep -n --color=auto'
alias fucking="sudo"
alias g="surfraw google"
alias gdb="gdb -quiet"
alias getclip='xclip -selection clipboard -o'
alias pbpaste='xclip -selection clipboard -o'
alias grep='grep --color=auto'
alias host2ip="dig +short"
alias http="http --pretty all"
alias install="sudo pacman -S --needed"
alias isntall="sudo pacman -S --needed"
alias js="node"
alias kbd_brightness="sudo tee /sys/devices/platform/asus-nb-wmi/leds/asus::kbd_backlight/brightness <<< "
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias ks=ls
alias ltodo="cat $HOME/Dropbox/TODO"
alias mkpkg="makepkg -s"
alias mobsf="mobsf-manage runserver"
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias mv="mv -v"
alias nmap-host-discovery="sudo nmap -sn -vv -n -oA discovery"
alias nmap-list-hosts="nmap -sL -n -PN"
alias nmap-list-script="ls /usr/share/nmap/scripts"
alias nmap-port-scan="sudo nmap -p- -A -Pn -vv -oA portscan"
alias nmap-ssh="nmap --script ssh2-enum-algos -vv -p 22 -Pn -oA nmap-ssh" #TODO filter for hmac 96 bit o md5 o cbc
alias nmap-ssl="nmap -sV -sC -vv -oA nmap-ssl"
alias nmap="sudo nmap"
alias office-to-pdf="libreoffice --headless --invisible --convert-to pdf"
alias open="xdg-open"
alias remove="sudo pacman -R "
alias setclip='xclip -selection c'
alias pbcopy='xclip -selection c'
alias sslscan="sslscan --no-failed"
alias stopx="pkill -15 X"
alias swap-flush="sudo swapoff -a && sudo swapon -a"
alias syn-ping="nmap -sn -PS -vv"
alias update="yaourt -Syua "
alias vi="vim -u NONE"
alias vim="vim -p"
alias vimconfig="vim $HOME/.vimrc"
alias vimo="vim -p -M"
alias volume="amixer set Master"
alias webshare='python -m http.server'
alias xpath="xmllint --xpath"
alias xrandr-above='xrandr --output $(xrandr | grep -Po "^[A-Z0-9]+(?= connected)") --auto --above eDP1'
alias xrandr-left='xrandr --output $(xrandr | grep -Po "^[A-Z0-9]+(?= connected)") --auto --left-of eDP1'
alias xrandr-right='xrandr --output $(xrandr | grep -Po "^[A-Z0-9]+(?= connected)") --auto --right-of eDP1'
alias xrandr-same='xrandr --output $(xrandr | grep -Po "^[A-Z0-9]+(?= connected)") --auto --same-as eDP1'
alias zshconfig="vim $(dirname $0)/zshrc-$(hostname).sh && exec zsh"
alias òs="ls"
