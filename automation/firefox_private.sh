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
"$SHELL" -c "$WAITLOADED"
xte "str about:config"
"$SHELL" -c "$KEY_RETURN"
xte "keydown Control_L" "key F" "keyup Control_L"
"$SHELL" -c "$WAITLOADED"
xte "str these preferences"
"$SHELL" -c "$WAITLOADED"
xte "key Escape"
"$SHELL" -c "$WAITLOADED"
xte "key Tab"
"$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$LOG \"End\""
