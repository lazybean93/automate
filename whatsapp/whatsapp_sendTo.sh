. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
setxkbmap -layout de
sh "$HOME""/whatsapp/whatsapp_loader.sh"
for i in $(seq 1 7); do
	xte 'key Tab'
	"$SHELL" -c "$LOG \"key Tab\""
	"$SHELL" -c "$WAITLOADED 1"
done
"$SHELL" -c "$WAITLOADED 5"
xte "str $1"
"$SHELL" -c "$LOG \"Enter $1\""
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$WAITLOADED 2"
"$SHELL" -c "$LOG \"End\""
