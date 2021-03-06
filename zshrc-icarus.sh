#alias cat="lolcat"
#fortune -n 300 -a -s
alias cat="lolcat"
#alias traceroute="mtr --curses -B --displaymode 2 -a "
alias rm="trash"
alias yaourtman="mv $HOME/.yaourtrc{,.bak}"
alias yaourtauto="mv $HOME/.yaourtrc{.bak,}"
alias jsonformat="jq -M -r ."
alias gosh="gore"
#alias kbf="setxkbmap us && xmodmap ~/.Xmodmap-lite"
#alias kb="xmodmap ~/.Xmodmap-lite"
#alias gpp="java -jar /usr/share/java/globalplatformpro/gp.jar"
alias fgrpe="fgrep"
alias aweconfig="vim $HOME/.config/awesome/rc.lua"
alias etodo="vim $HOME/Dropbox/TODO"
alias ltodo="cat $HOME/Dropbox/TODO"
alias omnisharp="mono ~/.vim/bundle/omnisharp-vim/server/OmniSharp/bin/Debug/OmniSharp.exe -p 2000"
alias mobsf="mobsf-manage runserver"
alias òs="ls"
#alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias emulator="export LD_PRELOAD='/usr/\$LIB/libstdc++.so.6 /usr/\$LIB/libgcc_s.so.1 /usr/\$LIB/libxcb.so.1 /usr/\$LIB/libgpg-error.so' && /home/rob/Android/Sdk/tools/qemu/linux-x86_64/qemu-system-x86_64 -netdelay none -netspeed full -avd Nexus_4_API_23 -gpu off"
alias copernico="bash /home/rob/empijei/foobar/copernico-menu/fetch.sh"
alias wpscan="docker run -it --rm wpscanteam/wpscan"
alias "/"="fgrep"
alias msfdocker="/home/rob/external_packages/github.com/rapid7/metasploit-framework/docker/bin/msfconsole"
#db_rebuild_cache
alias fzfcontent="grep --line-buffered --color=never -r '' * | fzf"

analyze-code(){
	echo "Counting lines of code"
	cloc --md --out=cloc.md .
	echo "Generating tags..."
	ctags -R .
	echo "Tags generated"
}
