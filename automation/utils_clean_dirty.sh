. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
killall firefox-esr > /dev/zero 2>&1
wmctrl -c "$(wmctrl -l | grep Firefox | sed 's/automate /\n/g' | tail -n1)" > /dev/zero 2>&1
killall thunderbird > /dev/zero 2>&1
killall crashreporter > /dev/zero 2>&1
sleep 1
rm -r "$HOME""/.ssh"
for i in $(seq 1 10); do
	if [ -n "$(ps -ely | grep firefox)" ]; then
		sleep 1
		"$SHELL" -c "$KEY_RETURN" > /dev/zero 2>&1
		wmctrl -c "$(wmctrl -l | grep Firefox | sed 's/automate /\n/g' | tail -n1)"
		"$SHELL" -c "$LOG \"Another Round\""
	else
		"$SHELL" -c "$LOG \"8 $i else\""
		break
	fi
done
if [ -n "$(ps -ely | grep firefox)" ]; then
    "$SHELL" -c "$LOG \"Start again\""
    "$SHELL" -c "$CLEAN_DIRTY"
fi
"$SHELL" -c "$LOG \"End\""
