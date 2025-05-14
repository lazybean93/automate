. "$HOME""/automation/env.sh"

echo "$1"
echo "$2"

"$SHELL" -c "$LOG \"Start\""
setxkbmap -layout de
sh "$HOME""/whatsapp/whatsapp_sendTo.sh" "$1"
xte "keydown Shift_L" "key Tab" "keyup Shift_L"
xte "keydown Shift_L" "key Tab" "keyup Shift_L"
"$SHELL" -c "$LOG \"Reverse Tab to get to paperclip\""
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$KEY_RETURN"
xte "key Up"
xte "key Up"
xte "key Up"
xte "key Up"
xte "key Up"
xte "key Up"
"$SHELL" -c "$LOG \"key Up to get to Documents\""
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$LOG \"wait for OpenFileDialog\""
TRIES=100
while [ -z "$(wmctrl -l | tail -n1 | grep 'Open Files\|Select Files\|File Upload')" ]; do
	sleep 0.1;
	TRIES=$(($TRIES-1));
	if [ $TRIES -eq 0 ]; then
		"$SHELL" -c "$CLEAN"
		"$SHELL" "$HOME""/whatsapp/whatsapp_document.sh" $1 $2
		"$SHELL" -c "$LOG \"End\""
		break
	fi
done
xte "str /"
sleep 1
xte "key BackSpace"
sleep 1
xte "str $2"
"$SHELL" -c "$LOG \"Enter $1\""
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$WAITLOADED 2"
"$SHELL" -c "$LOG \"Wait for Upload\""
"$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$WAITLOADED 4"
"$SHELL" -c "$CLEAN"
"$SHELL" -c "$LOG \"End\""
