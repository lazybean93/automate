. "$HOME""/automation/env.sh"

MODULO=23
DIVIDENT=0

"$SHELL" -c "$LOG \"Start\""
if [ "$(($(($(date +%s) / $((60*60*24)))) % $MODULO))" -ne "$DIVIDENT" ]; then
	"$SHELL" -c "$LOG \"In $(($MODULO - $(($(($(date +%s) / $((60*60*24)))) % $MODULO)))) Days\""
	exit
fi

"$SHELL" -c "$LOG \"Today ;)\""
"$HOME""/flatastic/noteToList.sh" "$HOME""/flatastic/zitronentee.txt"
