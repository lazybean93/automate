. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""

find "$HOME""/Downloads/"* -type d -exec rm -r {} + > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.de > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.html > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.part > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.png > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.jpg > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.xhtml > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.zip > /dev/zero 2>&1

"$SHELL" -c "$CLEAN_DIRTY"
"$SHELL" -c "$LOG \"Start again\""
"$SHELL" -c "$CLEAN"
"$SHELL" -c "$LOG \"End\""
