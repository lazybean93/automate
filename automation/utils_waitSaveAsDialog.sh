. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
sh -c "$WAITLOADED 1"
while [ -z "$(wmctrl -l | grep 'Save As\|All Files')" ]; do
        sleep 0.1
done
sh -c "$WAITLOADED 1"
sh -c "$LOG \"End\""
