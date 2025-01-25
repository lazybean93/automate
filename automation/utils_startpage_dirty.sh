. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
sh -c "$CLEAN_DIRTY"
sh -c "$LOG \"Cleaned\""
sh "$HOME""/automation/firefox_private.sh" "$1"
sh -c "$LOG \"End\""