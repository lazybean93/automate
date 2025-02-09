. "$HOME""/automation/env.sh"

$SHELL -c "$LOG \"Start: loading $1\""
firefox-esr --private-window $1 2>/dev/zero &
sleep 2;
killall firefox-esr > /dev/zero 2>&1
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
		return
	fi
done

echo 'user_pref("browser.translations.automaticallyPopup", false);' >> .mozilla/firefox/*/prefs.js;
echo 'user_pref("security.sandbox.warn_unprivileged_namespaces", false);' >> .mozilla/firefox/*/prefs.js;

firefox-esr --private-window $1 2>/dev/zero &
sleep 2;

ps -ely | grep firefox
if [ -n "$(ps -ely | grep defunct)" ]; then
	"$SHELL" -c "$CLEAN"
	"$SHELL" -c "sh $0 $1"
	exit
fi
if [ -z "$(ps -ely | grep firefox)" ]; then
	"$SHELL" -c "$CLEAN"
	"$SHELL" -c "sh $0 $1"
	exit
fi
"$SHELL" -c "$LOG \"Started Firefox\""
"$SHELL" -c "$WAITLOADED 4"
if [ -n "$(ps -ely | grep defunct)" ]; then
	"$SHELL" -c "$CLEAN"
	"$SHELL" -c "sh $0 $1"
	exit
fi
if [ -z "$(ps -ely | grep firefox)" ]; then
	"$SHELL" -c "$CLEAN"
	"$SHELL" -c "sh $0 $1"
	exit
fi

"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$LOG \"End\""

#user_pref("browser.translations.automaticallyPopup", false);
#user_pref("security.sandbox.warn_unprivileged_namespaces", false);