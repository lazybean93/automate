. "$HOME""/automation/env.sh"

if [ -n "$(ps -ely | grep defunct)" ]; then
	"$SHELL" -c "$LOG \"defunct\""
	exit 1
fi
if [ -z "$(ps -ely | grep firefox)" ]; then
	"$SHELL" -c "$LOG \"no firefox\""
	exit 1
fi
exit 0
