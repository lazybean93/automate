. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
sh -c "$CLEAN"
setxkbmap -layout de
sh "$HOME""/automation/firefox.sh" "https://web.whatsapp.com"
xte 'key F5'
sh -c "$WAITLOADED 2"
FILENAME="$HOME""/Downloads/scrot.jpg"
FILESIZE=0;
COUNT=0
while [ "$FILESIZE" -lt 300 ]; do
	COUNT=$(($COUNT+1))
	if [ "$COUNT" -gt "200" ]; then
		#did firefox have a problem?
		if [ -n "$(ps -ely | grep crashreporter)" ]; then
			sh "$HOME""/whatsapp/whatsapp_loader.sh"
			return;
		fi
		if [ -n "$(wmctrl -l | grep 'Tab crash reporter')" ]; then
			sh "$HOME""/whatsapp/whatsapp_loader.sh"
			return;
		fi
		sh -c "$LOG \"Abort after 200 tries\""
		sh "$HOME""/automation/utils_killScriptsContainingWhatsapp.sh"
		tsp -k
	fi
	scrot "$FILENAME"
	convert "$FILENAME" -crop 55x55+10+115 -threshold 85% "$FILENAME""_crop.jpg"
	rm "$FILENAME"
	FILESIZE="$(stat -c %s "$FILENAME""_crop.jpg")"
	rm "$FILENAME""_crop.jpg"
	sh -c "$WAITLOADED 1"
done
sh -c "$LOG \"End\""
