#ZSH WORKSTACK 
	export wsd="$HOME/.workstack"
	export wsn="d"
	export ws="$wsd/$wsn"
	#lists all available stacks
	lstacks(){ls "$wsd"}
	#destroy the file of a stack
	dstack(){rm "$wsd/$@"}
	#lists all entries in the current stack
	list(){	echo $wsn stack:;tail "$ws" -n +2;}
	#clears the current stack
	drop(){ echo "" > "$ws";}
	#pushes the arguments as a new entry
	push(){	echo "$@">>"$ws";	list;}
	#pushes a new entry preceeded with "cd " to current path
	dpush(){ push cd $PWD \; $@;}
	#shows the top of the stack without deleting it
	get(){ tail -1 "$ws";}
	#executes the top of the stack without deleting it
	eget(){	echo running: `get`; eval `get`;}
	#pops the top of the stack and shows it
	pop(){ get; TMP="`head -n -1 $ws`"; echo $TMP > "$ws";}
	#pops and executes the top of the stack
	epop(){	echo running: `get`; eval `pop`;}
	#changes stack file in use
	chstack(){ 
			export wsn="$1";	export ws="$wsd/$wsn" 
			[[ ! -e "$ws" ]] && echo "" > "$ws"; list;
			}
                    
