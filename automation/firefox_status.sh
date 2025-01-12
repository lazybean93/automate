. "$HOME""/automation/env.sh"

if [ -n "$(ps -ely | grep defunct)" ]; then
	sh -c "$LOG \"defunct\""
	exit 1
fi
if [ -z "$(ps -ely | grep firefox)" ]; then
	sh -c "$LOG \"no firefox\""
	exit 1
fi
exit 0
