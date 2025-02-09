. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""

if [ $# -lt 2 ]; then
	"$SHELL" -c "$LOG \"No Target\""
	exit
fi

BATTERYLEVEL="$(sh "$HOME""/pancake/pancake_batteryLevel.sh" | grep -v "$HOME""/automation/utils_clean.sh")"
#BATTERYLEVEL="74"
"$SHELL" -c "$LOG \"Batterylevel: $BATTERYLEVEL\""

"$SHELL" -c "$LOG \"Arguments: $#\""
ARGUMENTS="$(echo tsp -L "$0" sh "$0" "$1" "$2"\; tsp -u)"
if [ "$#" -eq "3" ]; then
	ARGUMENTS="$(echo tsp -L "$0" sh "$0" "$1" "$2" "$3"\; tsp -u)"
fi
"$SHELL" -c "$LOG \"Arguments\""
"$SHELL" -c "$LOG \"$ARGUMENTS\""
LOGVAR="$(echo possible RunScript: "$SHELL" -c \"$2 $3\")"; "$SHELL" -c "$LOG \"$LOGVAR\""

TARGETPERCENT_DIST="$(($1-$BATTERYLEVEL))"
SECADD="$(($TARGETPERCENT_DIST*76))"

DATESECS="$(sh "$HOME""/automation/utils_dateAdd.sh" "$SECADD")"

if [ ! -z "$(echo "$BATTERYLEVEL" | grep a)" ]; then
	"$SHELL" -c "$LOG \"case if\""
	LOGVAR="$(echo $(echo $BATTERYLEVEL | sed 's/a//')"% but not loading")"; "$SHELL" -c "$LOG \"$LOGVAR\""
	if [ "$DATESECS" -gt "$(sh "$HOME""/automation/utils_dateAdd.sh" "600")" ]; then
		sh "$HOME""/automation/utils_addCron.sh" "$DATESECS" "$ARGUMENTS"
	else
		sh "$HOME""/automation/utils_addCron.sh" "$(sh "$HOME""/automation/utils_dateAdd.sh" "600")" "$ARGUMENTS"
	fi
else
	"$SHELL" -c "$LOG \"case else\""
	if [ "$1" -gt "$BATTERYLEVEL" ]; then
		LOGVAR="$(echo $BATTERYLEVEL"% and loading")"; "$SHELL" -c "$LOG \"$LOGVAR\""
		LOGVAR="$(echo Estimated reach of "$1"% at "$DATESECS")"; "$SHELL" -c "$LOG \"$LOGVAR\""
		sh "$HOME""/automation/utils_addCron.sh" "$DATESECS" "$ARGUMENTS"
	else
		LOGVAR="$(echo $(echo $BATTERYLEVEL | sed 's/a//')"%")"; "$SHELL" -c "$LOG \"$LOGVAR\""
		"$SHELL" -c "$2 $3"
	fi
fi
"$SHELL" -c "$LOG \"End\""
