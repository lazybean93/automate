#!/bin/bash
. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
if [ $# -ne "1" ]; then
	"$SHELL" -c "$LOG \"Arg 1: List that should be added to shoppinglist\""
	exit
fi

readarray -t stuff < $1
"$SHELL" -c "$LOG \"$stuff\""

sh "$HOME""/automation/utils_startpage.sh" "https://www.flatastic-app.com/webapp/"
"$SHELL" -c "$LOG \"Enter Credentials\""
for i in $(seq 1 3); do
	xte 'key Tab'
done
"$SHELL" -c "$KEY_RETURN"
xte 'str oliver.tiebe@gmail.com'
"$SHELL" -c "$WAITLOADED 1"
xte 'key Tab'
"$SHELL" -c "$WAITLOADED 1"
xte 'str lnnkqfXv9bPkaCfxZBg1'
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$KEY_RETURN"
sh "$HOME""/automation/firefox_private.sh" "https://app.flatastic-app.com/#/shoppinglist"
for i in $(seq 1 4); do
	xte 'key Tab'
done
"$SHELL" -c "$WAITLOADED 1"
for i in $(seq 0 $((${#stuff[@]}-1))); do
	ITEM=${stuff[$i]}
	xte 'str '"$ITEM"
	"$SHELL" -c "$WAITLOADED 1"
	"$SHELL" -c "$KEY_RETURN"
done
"$SHELL" -c "$CLEAN"
"$SHELL" -c "$LOG \"End\""
