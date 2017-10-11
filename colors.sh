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
FOO $'\033[0;43;37;m'
NONE $'\033[0m'
K $'\033[0;30m'
R $'\033[0;31m'
G $'\033[0;32m'
Y $'\033[0;33m'
B $'\033[0;34m'
M $'\033[0;35m'
C $'\033[0;36m'
W $'\033[0;37m'
BGK $'\033[40m'
BGR $'\033[41m'
BGG $'\033[42m'
BGY $'\033[43m'
BGB $'\033[44m'
BGM $'\033[45m'
BGC $'\033[46m'
BGW $'\033[47m'
EMK $'\033[1;30m'
EMR $'\033[1;31m'
EMG $'\033[1;32m'
EMY $'\033[1;33m'
EMB $'\033[1;34m'
EMM $'\033[1;35m'
EMC $'\033[1;36m'
EMW $'\033[1;37m'
)

echolor(){
	local COLOR=$1
	shift
	echo ${COLORS[$COLOR]}$@${COLORS[NONE]}
}

color-reference(){
# source: http://bitmote.com/index.php?post/2012/11/19/Using-ANSI-Color-Codes-to-Colorize-Your-Bash-Prompt-on-Linux
# This echoes a bunch of color codes to the terminal to demonstrate
# what's available. Each line is the color code of one forground color,
# out of 17 (default + 16 escapes), followed by a test use of that color
# on all nine background colors (default + 8 escapes).
#
T='gYw'   # The test text
echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";
for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T \033[0m\033[$BG \033[0m";
  done
  echo;
done
echo
}
