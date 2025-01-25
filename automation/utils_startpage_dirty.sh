. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
sh "$HOME""/automation/firefox_private.sh" "$1"
sh -c "$LOG \"End\""
