. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
setxkbmap -layout de
sh "$HOME""/whatsapp/whatsapp_loader.sh"
for i in $(seq 1 6); do
	xte 'key Tab'
	sh -c "$LOG \"key Tab\""
	sh -c "$WAITLOADED 1"
done
sh -c "$WAITLOADED 5"
xte "str $1"
sh -c "$LOG \"Enter $1\""
sh -c "$WAITLOADED 1"
sh -c "$KEY_RETURN"
sh -c "$WAITLOADED 2"
sh -c "$LOG \"End\""
