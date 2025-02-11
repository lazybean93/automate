. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
for i in $(cat "$HOME""/prospektAldi/websites.txt"); do
	"$SHELL" "$HOME""/automation/utils_startpage.sh" "$i"
	"$SHELL" -c "$LOG \"Webpage $i Loaded\""

	"$SHELL" -c "$LOG \"Download\""
	xte "keydown Control_L" "key F" "keyup Control_L"
	"$SHELL" -c "$WAITLOADED 1"
	xte "str Download"
	"$SHELL" -c "$WAITLOADED 1"
	xte "key Escape"
	"$SHELL" -c "$WAITLOADED 1"
	"$SHELL" -c "$KEY_RETURN"
	"$SHELL" -c "$WAITLOADED 1"

	"$SHELL" "$HOME""/automation/utils_savePDF.sh"
	"$SHELL" "$HOME""/automation/utils_fdupes.sh" "$HOME""/Downloads"
	"$SHELL" "$HOME""/automation/utils_sendIfNew.sh" "Aldi Prospekte"
done
"$SHELL" -c "$CLEAN"
"$SHELL" -c "$LOG \"End\""
