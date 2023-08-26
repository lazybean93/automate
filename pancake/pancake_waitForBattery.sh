. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
BATTERYLEVEL="$(sh "$HOME""/pancake/pancake_batteryLevel.sh" | grep -v "$HOME""/automation/utils_clean.sh")"
while [ true ]; do
	if [ ! -z "$(echo "$BATTERYLEVEL" | grep a)" ]; then
		LOGVAR="$(echo $(echo $BATTERYLEVEL | sed 's/a//')"% but not loading")"; sh -c "$LOG \"$LOGVAR\""
		sleep 60
		BATTERYLEVEL="$(sh "$HOME""/pancake/pancake_batteryLevel.sh" | grep -v "$HOME""/automation/utils_clean.sh")"
	else
		if [ "$1" -gt "$BATTERYLEVEL" ]; then
			LOGVAR="$(echo $BATTERYLEVEL"% and loading")"; sh -c "$LOG \"$LOGVAR\""
			LOGVAR="$(echo Estimated reach of $1"% at "$(date -d "$(($(($1-$BATTERYLEVEL))*$((68)))) Seconds"))"; sh -c "$LOG \"$LOGVAR\""
			sleep 60
			BATTERYLEVEL="$(sh "$HOME""/pancake/pancake_batteryLevel.sh" | grep -v "$HOME""/automation/utils_clean.sh")"
		else
			break
		fi
	fi
done
sh -c "$LOG \"End\""
#50s pro Prozent
