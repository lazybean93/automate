. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""

BATTERYLEVEL="$(sh "$HOME""/pancake/pancake_batteryLevel.sh" | grep -v "$HOME""/automation/utils_clean.sh")"
#BATTERYLEVEL="74"
sh -c "$LOG \"Batterylevel: $BATTERYLEVEL\""

sh -c "$LOG \"Arguments: $#\""
ARGUMENTS="$(echo tsp -L "$0" sh "$0" "$1" "$2"\; tsp -u)"
if [ "$#" -eq "3" ]; then
	ARGUMENTS="$(echo tsp -L "$0" sh "$0" "$1" "$2" "$3"\; tsp -u)"
fi
sh -c "$LOG \"Arguments\""
sh -c "$LOG \"$ARGUMENTS\""
LOGVAR="$(echo possible RunScript: sh -c \"$2 $3\")"; sh -c "$LOG \"$LOGVAR\""

TARGETPERCENT_DIST="$(($1-$BATTERYLEVEL))"
SECADD="$(($TARGETPERCENT_DIST*77))"
DATE="$(date --date="+$SECADD Seconds")"
DATESECS="$(date --date="$DATE" +%s)"

if [ ! -z "$(echo "$BATTERYLEVEL" | grep a)" ]; then
	sh -c "$LOG \"case if\""
	LOGVAR="$(echo $(echo $BATTERYLEVEL | sed 's/a//')"% but not loading")"; sh -c "$LOG \"$LOGVAR\""
	if [ "$DATESECS" -gt "$(date --date='+10 Minutes' +%s)" ]; then
		sh "$HOME""/automation/utils_addCron.sh" "$DATE" "$ARGUMENTS"
	else
		sh "$HOME""/automation/utils_addCron.sh" "$(date --date='+10 Minutes')" "$ARGUMENTS"
	fi
else
	sh -c "$LOG \"case else\""
	if [ "$1" -gt "$BATTERYLEVEL" ]; then
		LOGVAR="$(echo $BATTERYLEVEL"% and loading")"; sh -c "$LOG \"$LOGVAR\""
		LOGVAR="$(echo Estimated reach of "$1"% at "$DATE")"; sh -c "$LOG \"$LOGVAR\""
		sh "$HOME""/automation/utils_addCron.sh" "$DATE" "$ARGUMENTS"
	else
		LOGVAR="$(echo $(echo $BATTERYLEVEL | sed 's/a//')"%")"; sh -c "$LOG \"$LOGVAR\""
		sh -c "$2 $3"
	fi
fi
sh -c "$LOG \"End\""
