. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
"$SHELL" -c "$CLEAN"
"$SHELL" -c "$LOG \"Cleaned\""
sh "$HOME""/automation/firefox_private.sh" "$1"
"$SHELL" -c "$LOG \"End\""
