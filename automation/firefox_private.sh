. "$HOME""/automation/env.sh"

"$LOG \"Start: loading $1\""
firefox-esr --private-window $1 2>/dev/zero &
sleep 5;
$SHELL -c "$LOG \"Close\""
for i in $(seq 1 10); do
	if [ -n "$(ps -ely | grep firefox)" ]; then
		sleep 1
		"$SHELL" -c "xte 'key Return'" > /dev/zero 2>&1
		wmctrl -c "$(wmctrl -l | grep Firefox | sed 's/'"$(uname -a | sed 's/ /\n/g' | head -n2 | grep -v Linux)"' /\n/g' | tail -n 1)"
		"$SHELL" -c "$LOG \"Another Round\""
	else
		break;
	fi
done

$SHELL -c "$LOG \"Set Custom Prefs\""
PREFFOLDER="$HOME""/.mozilla/firefox/""$(ls "$HOME"/.mozilla/firefox/ | grep default-esr)"
echo 'user_pref("browser.translations.automaticallyPopup", false);' >> "$PREFFOLDER"/prefs.js;
echo 'user_pref("security.sandbox.warn_unprivileged_namespaces", false);' >> "$PREFFOLDER"/prefs.js;


$SHELL -c "$LOG \"Restart\""
firefox-esr --private-window $1 2>/dev/zero &
sleep 2;

if [ -n "$(ps -ely | grep defunct)" ]; then
	"$SHELL" -c "$CLEAN"
	"$SHELL" -c "$SHELL"" $0 $1"
	exit
fi
if [ -z "$(ps -ely | grep firefox)" ]; then
	"$SHELL" -c "$CLEAN"
	"$SHELL" -c "$SHELL"" $0 $1"
	exit
fi
"$SHELL" -c "$LOG \"Started Firefox\""
"$SHELL" -c "$WAITLOADED 4"
if [ -n "$(ps -ely | grep defunct)" ]; then
	"$SHELL" -c "$CLEAN"
	"$SHELL" -c "$SHELL"" $0 $1"
	exit
fi
if [ -z "$(ps -ely | grep firefox)" ]; then
	"$SHELL" -c "$CLEAN"
	"$SHELL" -c "$SHELL"" $0 $1"
	exit
fi

"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$LOG \"End\""