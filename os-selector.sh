if [[ `uname` == 'Linux' ]]
then
	export LINUX=1
	source "$(dirname $0)/linux.sourceme"
	# If available, use LSB to identify distribution
	if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
		export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
		# Otherwise, use release info file
	else
		export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | head -n 1 | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
	fi
	# For everything else (or if above failed), just use generic identifier
	[[ "$DISTRO" == "" ]] && export DISTRO=$(uname)
	source "$(dirname $0)/$DISTRO.sourceme"
fi

if [[ `uname` == 'Darwin' ]]
then
	export OSX=1
	source "$(dirname $0)/darwin.sourceme"
fi
