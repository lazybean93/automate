. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start: loading $1\""
firefox-esr --private-window $1 2>/dev/zero &
sleep 2;
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
xte "keydown Control_L" "key T" "keyup Control_L" "sleep 1"
xte "key F6" "key F6" "sleep 1" "str about:config"
sh -c "$LOG \"End\""
