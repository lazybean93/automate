. "$HOME""/automation/env.sh"

setxkbmap -layout de
MYSTRING="$1"
LENGTH=250
while [ "$(printf "$MYSTRING" | wc -c)" -gt "$LENGTH" ]; do
	START="$(echo $MYSTRING | head -c $LENGTH)"
	#sh -c "$LOG \"$MYSTRING\""
	xte "str ""$START"
	MYSTRING="$(echo $MYSTRING | cut -c $(($LENGTH+1))-)"
done
#sh -c "$LOG \"$MYSTRING\""
xte "str $MYSTRING"
