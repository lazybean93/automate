. "$HOME""/automation/env.sh"

$SHELL -c "$LOG \"Start: loading $1\""
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
xte "keydown Control_L" "key T" "keyup Control_L"
"$SHELL" -c "$WAITLOADED 1"
xte "str about:config"
"$SHELL" -c "$KEY_RETURN"
xte "keydown Control_L" "key F" "keyup Control_L"
"$SHELL" -c "$WAITLOADED 1"
xte "str these preferences"
"$SHELL" -c "$WAITLOADED 1"
xte "key Escape"
"$SHELL" -c "$WAITLOADED 1"
xte "key Tab"
"$SHELL" -c "$KEY_RETURN"
xte "str browser.translations.automaticallyPopup"
"$SHELL" -c "$WAITLOADED 1"
WEBPAGE=$(sh "$HOME""/automation/utils_saveWebsite.sh")
if [ -z "$(cat "$WEBPAGE" | sed 's/>/>\n/g' | grep 'false</span>')" ]; then
	xte "keydown Control_L" "key F" "keyup Control_L"
	"$SHELL" -c "$WAITLOADED 1"
	xte "str true"
	"$SHELL" -c "$WAITLOADED 1"
	xte "key Escape"
	"$SHELL" -c "$WAITLOADED 1"
	xte "key Tab"
	"$SHELL" -c "$KEY_RETURN"
	xte "keydown Control_L" "key W" "keyup Control_L"
	"$SHELL" -c "$WAITLOADED 1"
fi
"$SHELL" -c "$LOG \"End\""
