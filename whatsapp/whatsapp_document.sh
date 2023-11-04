. "$HOME""/automation/env.sh"

echo "$1"
echo "$2"

sh -c "$LOG \"Start\""
setxkbmap -layout de
sh "$HOME""/whatsapp/whatsapp_sendTo.sh" "$1"
xte "keydown Shift_L" "key Tab" "keyup Shift_L"
xte "keydown Shift_L" "key Tab" "keyup Shift_L"
sh -c "$LOG \"Reverse Tab to get to paperclip\""
sh -c "$WAITLOADED 1"
sh -c "$KEY_RETURN"
xte "key Up"
xte "key Up"
xte "key Up"
xte "key Up"
xte "key Up"
xte "key Up"
sh -c "$LOG \"key Up to get to Documents\""
sh -c "$WAITLOADED 1"
sh -c "$KEY_RETURN"
sh -c "$LOG \"wait for OpenFileDialog\""
TRIES=100
while [ -z "$(wmctrl -l | tail -n1 | grep 'Open Files\|Select Files\|File Upload')" ]; do
	sleep 0.1;
	TRIES=$(($TRIES-1));
	if [ $TRIES -eq 0 ]; then
		sh -c "$CLEAN"
		sh "$HOME""/whatsapp/whatsapp_document.sh" $1 $2
		sh -c "$LOG \"End\""
		return
	fi
done
xte "str /"
sleep 1
xte "key BackSpace"
sleep 1
xte "str $2"
sh -c "$LOG \"Enter $1\""
sh -c "$WAITLOADED 1"
sh -c "$KEY_RETURN"
sh -c "$WAITLOADED 2"
sh -c "$LOG \"Wait for Upload\""
sh -c "$KEY_RETURN"
sh -c "$WAITLOADED 4"
sh -c "$CLEAN"
sh -c "$LOG \"End\""
