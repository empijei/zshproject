alias cat="lolcat"
alias yaourtman="mv $HOME/.yaourtrc{,.bak}"
alias yaourtauto="mv $HOME/.yaourtrc{.bak,}"
alias gosh="gore"
alias kb="setxkbmap it -option caps:escape && xmodmap ~/.Xmodmap-lite"
alias gpp="java -jar /usr/share/java/globalplatformpro/gp.jar"
alias fgrpe="fgrep"
alias aweconfig="vim $HOME/.config/awesome/rc.lua"
alias etodo="vim $HOME/Dropbox/TODO"
alias ltodo="cat $HOME/Dropbox/TODO"
alias mobsf="mobsf-manage runserver"
alias òs="ls"
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias emulator="export LD_PRELOAD='/usr/\$LIB/libstdc++.so.6 /usr/\$LIB/libgcc_s.so.1 /usr/\$LIB/libxcb.so.1 /usr/\$LIB/libgpg-error.so' && /home/rob/Android/Sdk/tools/qemu/linux-x86_64/qemu-system-x86_64 -netdelay none -netspeed full -avd Nexus_4_API_23 -gpu off"

export JC_HOME="/opt/java/lib/java-card-development-kit/"
export JAVA_HOME="/usr/lib/jvm/java-8-jdk/"
export PATH="$PATH:$JC_HOME/bin:$JAVA_HOME/bin"
