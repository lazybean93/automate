. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
killall firefox-esr > /dev/zero 2>&1
wmctrl -c "$(wmctrl -l | grep Firefox | sed 's/automate /\n/g' | tail -n1)" > /dev/zero 2>&1
killall thunderbird > /dev/zero 2>&1
find "$HOME""/Downloads/"* -type d -exec rm -r {} + > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.de > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.html > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.part > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.png > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.jpg > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.xhtml > /dev/zero 2>&1
rm  "$HOME""/Downloads/"*.zip > /dev/zero 2>&1
killall crashreporter > /dev/zero 2>&1
sleep 1
rm -r "$HOME""/.ssh"
for i in $(seq 1 10); do
	if [ -n "$(ps -ely | grep firefox)" ]; then
		sleep 1
		sh -c "$KEY_RETURN" > /dev/zero 2>&1
		wmctrl -c "$(wmctrl -l | grep Firefox | sed 's/automate /\n/g' | tail -n1)"
		sh -c "$LOG \"Another Round\""
	else
		sh -c "$LOG \"8 $i else\""
		return
	fi
done
sh -c "$LOG \"Start again\""
sh -c "$CLEAN"
sh -c "$LOG \"End\""
