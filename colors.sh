# regular colors are single letters
# emphasized (bolded) colors are prefixed with EM
# background colors are prefixed with BG
# colors are, in order
# K black
# R red
# G green
# Y yellow
# B blue
# M magenta
# C cyan
# W white

typeset -A COLORS
COLORS=(
NONE $'\033[0m'
K $'\033[0;30m'
R $'\033[0;31m'
G $'\033[0;32m'
Y $'\033[0;33m'
B $'\033[0;34m'
M $'\033[0;35m'
C $'\033[0;36m'
W $'\033[0;37m'
EMK $'\033[1;30m'
EMR $'\033[1;31m'
EMG $'\033[1;32m'
EMY $'\033[1;33m'
EMB $'\033[1;34m'
EMM $'\033[1;35m'
EMC $'\033[1;36m'
EMW $'\033[1;37m'
BGK $'\033[40m'
BGR $'\033[41m'
BGG $'\033[42m'
BGY $'\033[43m'
BGB $'\033[44m'
BGM $'\033[45m'
BGC $'\033[46m'
BGW $'\033[47m'
)

echolor(){
	local COLOR=$1
	shift
	echo ${COLORS[$COLOR]}$@${COLORS[NONE]}
}
