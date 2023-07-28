. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start: loading $1\""
#sh -c "$LOG \"Start: 1\""
firefox-esr $1 2>/dev/zero &
#sh -c "$LOG \"Start: 2\""
sleep 2;
#sh -c "$LOG \"Start: 3\""
ps -ely | grep firefox
if [ -n "$(ps -ely | grep defunct)" ]; then
	sh -c "$CLEAN"
	sh -c "sh $0 $1"
	exit
fi
if [ -z "$(ps -ely | grep firefox)" ]; then
	sh -c "$CLEAN"
	sh -c "sh $0 $1"
	exit
fi
#sh -c "$LOG \"Start: 8\""
sh -c "$LOG \"Started Firefox\""
sh -c "$WAITLOADED 4"
if [ -n "$(ps -ely | grep defunct)" ]; then
	sh -c "$CLEAN"
	sh -c "sh $0 $1"
	exit
fi
if [ -z "$(ps -ely | grep firefox)" ]; then
	sh -c "$CLEAN"
	sh -c "sh $0 $1"
	exit
fi
sh -c "$LOG \"End\""
