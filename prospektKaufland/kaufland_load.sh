. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
sh "$HOME""/automation/utils_startpage.sh" "$(cat "$HOME""/prospektKaufland/website.txt")"
sh "$HOME""/automation/firefox_private.sh" "https://filiale.kaufland.de/prospekte.html"
sleep 5
WEBPAGE="$("$SHELL" "$HOME""/automation/utils_saveWebsite.sh")"
LINKS=$(cat "$WEBPAGE" | sed 's/"/\n/g' | grep leaflets | grep -v imgproxy)
rm "$WEBPAGE"
"$SHELL" -c "$LOG \"echo \$LINKS | sed 's/ /\n/g'\""
LOGVAR="$(echo ""; echo "$LINKS" | sed 's/ /"\n"/g')"; "$SHELL" -c "$LOG \"$LOGVAR\""
xte 'key Escape'
FILELIST=""
for i in $(echo "$LINKS" | sed 's/ /\n/g'); do
	"$SHELL" -c "$LOG \"Current Link: "$i"\""
	if [ -n "$(echo $i | grep '\.pdf$')" ]; then
		"$SHELL" -c "$LOG \"Link is a PDF\""
		"$SHELL" "$HOME""/automation/firefox_private.sh" "$i"
		"$SHELL" "$HOME""/automation/utils_savePDF.sh"
	else
		"$SHELL" -c "$LOG \"Link is a Webpage\""
		"$SHELL" "$HOME""/automation/firefox_private.sh" "$i"
		"$SHELL" -c "$LOG \"Manipulate URL 1. Press F6\""
		xte "key F6"
		"$SHELL" -c "$WAITLOADED 1"
		"$SHELL" -c "$LOG \"Manipulate URL 2. Remove selection\""
		xte "key Right"
		"$SHELL" -c "$WAITLOADED 1"
		"$SHELL" -c "$LOG \"Manipulate URL 3. Delete last 12 chars\""
		for i in $(seq 1 12); do
			xte "key BackSpace"
		done
		"$SHELL" -c "$WAITLOADED 1"
		"$SHELL" -c "$LOG \"Manipulate URL 4. Write new suffix\""
		xte 'str menu/page/1'
		"$SHELL" -c "$WAITLOADED 1"
		"$SHELL" -c "$LOG \"Manipulate URL 5. Load manipulated URL\""
		"$SHELL" -c "$KEY_RETURN"
		WEBPAGE="$("$SHELL" "$HOME""/automation/utils_saveWebsite.sh")"
		PDF=$(cat "$WEBPAGE" | sed 's/"/\n/g' | grep '\.pdf')
		rm "$WEBPAGE"
		LOGVAR="$(echo "PDF:" "$PDF")"; "$SHELL" -c "$LOG \"$LOGVAR\""
		echo ""
		FILENAME="$(wget "$PDF" -P "$HOME""/Downloads" -o /dev/stdout | sed 's/‘/\n/g' | grep '\.pdf' | sed 's/’/\n/g' | grep '\.pdf' | tail -n1)"
		LOGVAR="$(echo "FILENAME:" "$FILENAME")"; "$SHELL" -c "$LOG \"$LOGVAR\""
	fi
	"$SHELL" "$HOME""/automation/utils_fdupes.sh" "$HOME""/Downloads"
	"$SHELL" "$HOME""/automation/utils_sendIfNew.sh" "Kaufland Prospekte"
done

"$SHELL" -c "$LOG \"End\""
