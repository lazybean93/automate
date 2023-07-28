. "$HOME""/automation/env.sh"

LOG="#"
sh -c "$LOG \"Start\""
EQUALCOUNT=0

PROCESSES="$(ps -ely)"
if [ ! -z "$(echo "$PROCESSES" | grep -i crashreporter)" ]; then
	sh -c "$LOG \"Crashreporter found, stopping execution\""
	exit;
fi
if [ ! -z "$(wmctrl -l | grep "Open Firefox in Troubleshoot Mode?")" ]; then
	sh -c "$LOG \"\tFirefox Error found.\""
	sh "$HOME""/automation/utils_sendkey_Return.sh"
fi


BROWSER="firefox-esr"
if [ -z "$(echo "$PROCESSES" | grep $BROWSER)" ]; then
	BROWSER="firefox"
fi
if [ -z "$(echo "$PROCESSES" | grep $BROWSER)" ]; then
	BROWSER="chromium"
fi
if [ -z "$(echo "$PROCESSES" | grep $BROWSER)" ]; then
	BROWSER="thunderbird"
fi
if [ -z "$(echo "$PROCESSES" | grep $BROWSER)" ]; then
	sh -c "$LOG \"Browser not Found, try again\""
	sh "$0"
fi

sh -c "$LOG \"$BROWSER \""
START=$(date +%s)

EQUALVAL="$(echo "$PROCESSES" | grep $BROWSER | sed 's/ /\n/g' | grep -v '^$' | head -n 8 | tail -n1)"

while [ 10 -gt $EQUALCOUNT ]; do
	if [ "$(($(date +%s)-$START))" -gt "200" ]; then
		sh -c "$LOG \"Reached Timeout\""
		exit;
	fi
	MEM="$(ps -ely | grep $BROWSER | sed 's/ /\n/g' | grep -v '^$' | head -n 8 | tail -n1)"
	if [ -z "$MEM" ]; then
		sh -c "$LOG \"No Memory Statistics Found\""
		exit;
	fi
#	echo $MEM
	if [ "$(($(($MEM/700))*701))" -gt "$EQUALVAL" ] || [ "$MEM" -eq "$EQUALVAL" ]; then
		EQUALCOUNT=$((EQUALCOUNT+1))
	else
		sh -c "$LOG \"And another round\""
		sh -c "$LOG \"OLD: $EQUALVAL\""
		sh -c "$LOG \"NEW: $MEM\""
		sleep 5
		EQUALCOUNT=0
		EQUALVAL=$(ps -ely | grep $BROWSER | sed 's/ /\n/g' | grep -v '^$' | head -n 8 | tail -n1)
	fi
	sleep 0.1;
done

sh -c "$LOG \"Watch Network\""

while [ ! -z "$(ifstat 0.1 5 | tail -n5 | grep -v ' [0-1]\.[0-9][0-9]')" ]; do
	sleep 0.1
done
sh -c "$LOG \"End\""
