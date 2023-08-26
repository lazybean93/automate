. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
for i in $(cat "$HOME""/prospektAldi/websites.txt"); do
	sh "$HOME""/automation/utils_startpage.sh" "$i"
	sh -c "$LOG \"Webpage $i Loaded\""

	sh -c "$LOG \"Download\""
	xte "keydown Control_L" "key F" "keyup Control_L"
	sh -c "$WAITLOADED 1"
	xte "str Download"
	sh -c "$WAITLOADED 1"
	xte "key Escape"
	sh -c "$WAITLOADED 1"
	sh -c "$KEY_RETURN"
	sh -c "$WAITLOADED 1"

	sh "$HOME""/automation/utils_savePDF.sh"
	sh "$HOME""/automation/utils_fdupes.sh" "$HOME""/Downloads"
	sh "$HOME""/automation/utils_sendIfNew.sh" "Aldi Prospekte"
done
sh -c "$CLEAN"
sh -c "$LOG \"End\""
