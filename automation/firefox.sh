. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start: loading $1\""
#"$SHELL" -c "$LOG \"Start: 1\""
firefox-esr $1 2>/dev/zero &
#"$SHELL" -c "$LOG \"Start: 2\""
sleep 2;
#"$SHELL" -c "$LOG \"Start: 3\""
ps -ely | grep firefox
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
#"$SHELL" -c "$LOG \"Start: 8\""
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
"$SHELL" -c "$LOG \"End\""
