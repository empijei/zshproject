commit(){
	git add *
	git add -u
	git commit
}

mkcdir(){
	mkdir $1
	cd $1
}
alias mkcd="mkcdir"

alias -g cv='$CLIP'

commitp(){
	commit
	git push
}

todo(){
	echo "$@""	[$(date +%d-%m-%y)]" >> $HOME/Dropbox/TODO
}
alias ltodo="cat $HOME/Dropbox/TODO"
alias etodo="vim $HOME/Dropbox/TODO"


#changes the current terminal title
title(){echo -en "\033]0;$@\a"}
#executes calculation with floating point operations
calc(){print $(($@));}
#changes base to a number
#chbase(){print $(([#$3] $2#$1 ));}

extract-archive () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

#ZSH HELPER (local)
useful(){
	fgrep "$@"  $HOME/useful-commands/*.use -R
}

#ZSH HELPER (cache search)
#alias search="pacman -Ss "
search(){
	pkgfile $@
	yaourt -Ss $@
}

#ZSH HELPER (all together)
help(){
	pacman -Ss $@
	man -k $@
	useful $@
}

whereami(){
	curl "https://maps.googleapis.com/maps/api/browserlocation/json?browser=firefox&sensor=true" \
		--data-urlencode "$(nmcli -f SSID,BSSID,SIGNAL dev wifi list | sed -rn 's/(.*[^ ])[ ]*(..:..:..:..:..:..)  ([0-9]*) .*/\&wifi=mac:\2|ssid:\1|ss:\3/p' | tr -d '\n')" 2>/dev/null |
	egrep "(lat|lng|accuracy)" | 
	tr -d '" ,' | 
	sed -r -e 's/lat:/latitude = /' -e 's/lng:/longitude = /' -e 's/accuracy:([0-9]*)/accuracy = \1 m/g'
	#jshon -e location |
	# sed -rn -e 's/ "lat": (.*),/latitude: \1/p' -e 's/ "lng": (.*)/longitude: \1/p'
#	jshon -e location -e lat -u -p -e lng
}
                  

random-bytes(){
	dd if=/dev/urandom bs=1 2>/dev/null count=$1
}

random-alnum(){
	cat /dev/urandom| 
	egrep -o --text '[0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]' |
	tr -d '\n' |
	head -c $1 
}

random-chars(){
	cat /dev/urandom| 
	egrep -o --text '[0-9a-zA-Z]' |
	head -n $1 |
	tr -d '\n'
}         

putclip(){
	cat "$@" | xclip -selection c
}

enit(){
	xdg-open "https://translate.google.it/#en/it/$(urlencode $@)"
}
iten(){
	xdg-open "https://translate.google.it/#it/en/$(urlencode $@)"
}
                       
jd-vim(){
procyon $@ | vim -c "set filetype=java buftype=nofile bufhidden=hide noswapfile" -
}

ip2host(){
	dig -x "$@" | egrep -v "^;|^$"
}

vimtemp(){
	local filename=$(mktemp /tmp/vimtemp.XXXXXXX)
	echo Editing: $filename
	vim $filename
}

j(){
	cd "$(autojump "$1")"
}
random-words(){
	shuf -n $1 <(cat /usr/share/dict/words |
		egrep -o "\w{2}\w+" )|
	tr '\n' ' '
}

YCMUpdate(){
	pushd ~/.vim/bundle/YouCompleteMe
	git submodule update --init --recursive
	python2 install.py --omnisharp-completer --gocode-completer
	popd
}

unique-subject(){
echo "--"$(random-chars 6)"--" | xclip -selection c
}

# depends on inflate, run
# run go get github.com/empijei/inflate
saml-decode(){
	cat $@ | base64 -d | inflate 
}

saml-pretty-decode(){
	saml-decode $@ | xmllint --format - | vimcat
}

saml-encode(){
	cat $@ | inflate -d -l -1 | base64 | tr -d '\n'
}

urlencode() {
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:$i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%s' "$c" | xxd -p -c1 |
                   while read c; do printf '%%%s' "$c"; done ;;
        esac
    done
}

urldecode() {
    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//"%"/\\x}"
}

datedecode(){
	date -d @$1
}

backup(){
 if [[ -e "$1.bak" ]] ; then
	 echo "Error, backup already exist!"
 else
	 mv "$1" "$1.bak"
 fi
}
