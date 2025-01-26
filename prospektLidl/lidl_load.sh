. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
sh "$HOME""/automation/utils_startpage.sh" "$(cat "$HOME""/prospektLidl/website.txt")"
WEBPAGE="$(sh "$HOME""/automation/utils_saveWebsite.sh")"
PDFLIST="$(cat "$WEBPAGE" | sed 's/"/\n/g' | grep pdf | grep http)"
rm -r "$WEBPAGE"
FILENAMES=""
for i in $(echo "$PDFLIST" | sed 's/ /\n/g'); do
	echo ""
	"$SHELL" -c "$LOG \"$i\""
	FILENAME="$(wget "$i" -P "$HOME"/Downloads -o /dev/stdout | sed 's/‘/\n/g' | grep '\.pdf' | sed 's/’/\n/g' | grep '\.pdf' | tail -n1)"
	FILENAMES="$FILENAMES"" ""$FILENAME"
done
sh "$HOME""/automation/utils_fdupes.sh" "$HOME""/Downloads"
for i in $(echo "$FILENAMES" | sed 's/ /\n/g'); do
	if [ -f "$i" ]; then
		"$SHELL" -c "$LOG \"Filename found\""
        	FILENAME_NEW="$i"_$(sh "$HOME""/automation/utils_getDate_ymd_hms.sh").pdf
        	mv "$i" "$FILENAME_NEW"
		sh "$HOME""/whatsapp/whatsapp_document.sh" "Lidl Prospekte" "$FILENAME_NEW"
	fi
done
"$SHELL" -c "$CLEAN"
"$SHELL" -c "$LOG \"End\""
