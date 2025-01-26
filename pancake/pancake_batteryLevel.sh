. "$HOME""/automation/env.sh"

#"$SHELL" -c "$LOG \"Start\""
sh "$HOME""/pancake/pancake_startpage.sh" > $HIDEFILE 2>&1
WEBPAGE="$(sh "$HOME""/automation/utils_saveWebsite.sh")"
BATTERYLEVEL=$(cat "$WEBPAGE" | grep battery-status-text-value\" | sed 's/value">/\n/g' | tail -n1 | sed 's/</\n/' | head -n1)
STATE=$(cat "$WEBPAGE" | grep "\"robot-state\"" | sed 's/>/\n/' | tail -n1 | sed 's/</\n/' | head -n1)
rm "$WEBPAGE"
#Leerlauf
#Reinigung
if [ "$STATE" = "Lädt" ]; then
	echo $BATTERYLEVEL
else
	echo a$BATTERYLEVEL
fi
"$SHELL" -c "$CLEAN"
#"$SHELL" -c "$LOG \"End\""
