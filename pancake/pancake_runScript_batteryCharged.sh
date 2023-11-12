. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""

if [ $# -ne 2 ]; then
	sh -c "$LOG \"No Target\""
	exit
fi

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
SECADD="$(($TARGETPERCENT_DIST*76))"

DATESECS="$(sh "$HOME""/automation/utils_dateAdd.sh" "$SECADD")"

if [ ! -z "$(echo "$BATTERYLEVEL" | grep a)" ]; then
	sh -c "$LOG \"case if\""
	LOGVAR="$(echo $(echo $BATTERYLEVEL | sed 's/a//')"% but not loading")"; sh -c "$LOG \"$LOGVAR\""
	if [ "$DATESECS" -gt "$(sh "$HOME""/automation/utils_dateAdd.sh" "600")" ]; then
		sh "$HOME""/automation/utils_addCron.sh" "$DATESECS" "$ARGUMENTS"
	else
		sh "$HOME""/automation/utils_addCron.sh" "$(sh "$HOME""/automation/utils_dateAdd.sh" "600")" "$ARGUMENTS"
	fi
else
	sh -c "$LOG \"case else\""
	if [ "$1" -gt "$BATTERYLEVEL" ]; then
		LOGVAR="$(echo $BATTERYLEVEL"% and loading")"; sh -c "$LOG \"$LOGVAR\""
		LOGVAR="$(echo Estimated reach of "$1"% at "$DATESECS")"; sh -c "$LOG \"$LOGVAR\""
		sh "$HOME""/automation/utils_addCron.sh" "$DATESECS" "$ARGUMENTS"
	else
		LOGVAR="$(echo $(echo $BATTERYLEVEL | sed 's/a//')"%")"; sh -c "$LOG \"$LOGVAR\""
		sh -c "$2 $3"
	fi
fi
sh -c "$LOG \"End\""
