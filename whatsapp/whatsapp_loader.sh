. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
"$SHELL" -c "$CLEAN"
setxkbmap -layout de
sh "$HOME""/automation/firefox.sh" "https://web.whatsapp.com"
xte 'key F5'
"$SHELL" -c "$WAITLOADED 2"
FILENAME="$HOME""/Downloads/scrot.jpg"
FILESIZE=0;
COUNT=0
while [ "$FILESIZE" -lt 300 ]; do
	COUNT=$(($COUNT+1))
	if [ "$COUNT" -gt "200" ]; then
		#did firefox have a problem?
		if [ -n "$(ps -ely | grep crashreporter)" ]; then
			"$SHELL" "$HOME""/whatsapp/whatsapp_loader.sh"
			break;
		fi
		if [ -n "$(wmctrl -l | grep 'Tab crash reporter')" ]; then
			"$SHELL" "$HOME""/whatsapp/whatsapp_loader.sh"
			break;
		fi
		"$SHELL" -c "$LOG \"Abort after 200 tries\""
		"$SHELL" "$HOME""/automation/utils_killScriptsContainingWhatsapp.sh"
		tsp -k
	fi
	scrot "$FILENAME"
	convert "$FILENAME" -crop 55x55+10+115 -threshold 85% "$FILENAME""_crop.jpg"
	rm "$FILENAME"
	FILESIZE="$(stat -c %s "$FILENAME""_crop.jpg")"
	rm "$FILENAME""_crop.jpg"
	"$SHELL" -c "$WAITLOADED 1"
done
"$SHELL" -c "$LOG \"End\""
