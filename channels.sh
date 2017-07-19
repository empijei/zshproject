closechannel(){
	rm $1
	unset channels[$1]
}

writechannel(){
	preparechannel $1 &&
		cat >$channels[$1]
}

readchannel(){
	preparechannel $1 &&
		cat $channels[$1]
}

preparechannel(){
	#TODO check number of params, must be one
	#TODO create channel if not exists
	if [[ "$1" == "" ]]; then
		echo "invalid channel name"
		return 1
	fi
	if [[ "$channels[$1]" == "" ]]; then
		PIPE=$(mktemp -u -t channel.XXXXXXXXX)
		mkfifo $PIPE
		channels[$1]=$PIPE
	fi
}

declare -A channels
alias -g →="| writechannel"
alias -g ←="readchannel"
