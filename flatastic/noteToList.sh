#!/bin/bash
. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
if [ $# -ne "1" ]; then
	sh -c "$LOG \"Arg 1: List that should be added to shoppinglist\""
	exit
fi

readarray -t stuff < $1
sh -c "$LOG \"$stuff\""

sh "$HOME""/automation/utils_startpage.sh" "https://www.flatastic-app.com/webapp/"
sh -c "$LOG \"Enter Credentials\""
for i in $(seq 1 3); do
	xte 'key Tab'
done
sh -c "$KEY_RETURN"
xte 'str oliver.tiebe@gmail.com'
sh -c "$WAITLOADED 1"
xte 'key Tab'
sh -c "$WAITLOADED 1"
xte 'str lnnkqfXv9bPkaCfxZBg1'
sh -c "$WAITLOADED 1"
sh -c "$KEY_RETURN"
sh "$HOME""/automation/firefox_private.sh" "https://app.flatastic-app.com/#/shoppinglist"
for i in $(seq 1 4); do
	xte 'key Tab'
done
sh -c "$WAITLOADED 1"
for i in $(seq 0 $((${#stuff[@]}-1))); do
	ITEM=${stuff[$i]}
	xte 'str '"$ITEM"
	sh -c "$WAITLOADED 1"
	sh -c "$KEY_RETURN"
done
sh -c "$CLEAN"
sh -c "$LOG \"End\""
