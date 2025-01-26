. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
"$SHELL" -c "$WAITLOADED 1"
while [ -z "$(wmctrl -l | grep 'Save As\|All Files')" ]; do
        sleep 0.1
done
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$LOG \"End\""
