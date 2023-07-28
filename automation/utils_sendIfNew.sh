FILENAME="$(sh "$HOME""/automation/utils_getNewestFile.sh" "$HOME""/Downloads/")"
if [ ! -z "$FILENAME" ]; then
	FILENAME_NEW="$FILENAME"_$(sh "$HOME""/automation/utils_getDate_ymd_hms.sh").pdf
	mv "$FILENAME" "$FILENAME_NEW"
	sh "$HOME""/whatsapp/whatsapp_document.sh" "$1" "$FILENAME_NEW";
else
	sh -c "$CLEAN"
fi
