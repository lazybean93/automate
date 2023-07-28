. "$HOME""/automation/env.sh"

sh -c "$LOG Start"

sh -c "$LOG \"1. Set Number of Tries.\""
TRIES=10
if [ $# -eq 1 ]; then
	TRIES=$1
fi
sh -c "$LOG \"\tNumber of Tries: $TRIES \""

sh -c "$LOG \"2. Check for Dialog to appear.\""
sh -c "$WAITLOADED 2"
while [ -z "$(wmctrl -l | tail -n1 | grep Opening)" ]; do
	TRIES=$(($TRIES-1))
	if [ "$TRIES" -eq "0" ]; then
		sh -c "$LOG \"\tNumber of Tries Exceeded.\""
		sh "$HOME""/automation/utils_printWebsitePDF.sh"
		sh "$HOME""/automation/utils_putCurrentJobAgain.sh"
		return
	fi
	sleep 0.1;
done
sh -c "$LOG \"\tDialog appeared, $TRIES tries left.\""
sh -c "$WAITLOADED 1"
sh -c "$KEY_RETURN"
sh -c "$WAITLOADED 1"
sh -c "$LOG End"
