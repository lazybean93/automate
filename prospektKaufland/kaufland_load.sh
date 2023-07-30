. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
sh "$HOME""/automation/utils_startpage.sh" "$(cat "$HOME""/prospektKaufland/website.txt")"
sh "$HOME""/automation/firefox_private.sh" "https://filiale.kaufland.de/prospekte.html"
sleep 5
WEBPAGE="$(sh "$HOME""/automation/utils_saveWebsite.sh")"
LINKS=$(cat "$WEBPAGE" | sed 's/"/\n/g' | grep leaflets)
rm "$WEBPAGE"
sh -c "$LOG \"echo \$LINKS | sed 's/ /\n/g'\""
LOGVAR="$(echo ""; echo "$LINKS" | sed 's/ /"\n"/g')"; sh -c "$LOG \"$LOGVAR\""
xte 'key Escape'
FILELIST=""
for i in $(echo "$LINKS" | sed 's/ /\n/g'); do
	sh -c "$LOG \"Current Link: "$i"\""
	if [ -n "$(echo $i | grep '\.pdf$')" ]; then
		sh -c "$LOG \"Link is a PDF\""
		sh "$HOME""/automation/firefox_private.sh" "$i"
		sh "$HOME""/automation/utils_savePDF.sh"
	else
		sh -c "$LOG \"Link is a Webpage\""
		sh "$HOME""/automation/firefox_private.sh" "$i"
		sh -c "$LOG \"Manipulate URL 1. Press F6\""
		xte "key F6"
		sh -c "$WAITLOADED 1"
		sh -c "$LOG \"Manipulate URL 2. Remove selection\""
		xte "key Right"
		sh -c "$WAITLOADED 1"
		sh -c "$LOG \"Manipulate URL 3. Delete last 12 chars\""
		for i in $(seq 1 12); do
			xte "key BackSpace"
		done
		sh -c "$WAITLOADED 1"
		sh -c "$LOG \"Manipulate URL 4. Write new suffix\""
		xte 'str menu/page/1'
		sh -c "$WAITLOADED 1"
		sh -c "$LOG \"Manipulate URL 5. Load manipulated URL\""
		sh -c "$KEY_RETURN"
		WEBPAGE="$(sh "$HOME""/automation/utils_saveWebsite.sh")"
		PDF=$(cat "$WEBPAGE" | sed 's/"/\n/g' | grep '\.pdf')
		rm "$WEBPAGE"
		LOGVAR="$(echo "PDF:" "$PDF")"; sh -c "$LOG \"$LOGVAR\""
		echo ""
		FILENAME="$(wget "$PDF" -P "$HOME""/Downloads" -o /dev/stdout | sed 's/‘/\n/g' | grep '\.pdf' | sed 's/’/\n/g' | grep '\.pdf' | tail -n1)"
		LOGVAR="$(echo "FILENAME:" "$FILENAME")"; sh -c "$LOG \"$LOGVAR\""
	fi
	sh "$HOME""/automation/utils_fdupes.sh" "$HOME""/Downloads"
	sh "$HOME""/automation/utils_sendIfNew.sh" "Kaufland Prospekte"
done

sh -c "$LOG \"End\""
