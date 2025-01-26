. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG Start"

"$SHELL" -c "$LOG \"1. Set Number of Tries.\""
TRIES=10
if [ $# -eq 1 ]; then
	TRIES=$1
fi
"$SHELL" -c "$LOG \"\tNumber of Tries: $TRIES \""

"$SHELL" -c "$LOG \"2. Check for Dialog to appear.\""
"$SHELL" -c "$WAITLOADED 2"
while [ -z "$(wmctrl -l | tail -n1 | grep Opening)" ]; do
	TRIES=$(($TRIES-1))
	if [ "$TRIES" -eq "0" ]; then
		"$SHELL" -c "$LOG \"\tNumber of Tries Exceeded.\""
		sh "$HOME""/automation/utils_printWebsitePDF.sh"
		sh "$HOME""/automation/utils_putCurrentJobAgain.sh"
		return
	fi
	sleep 0.1;
done
"$SHELL" -c "$LOG \"\tDialog appeared, $TRIES tries left.\""
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$LOG End"
