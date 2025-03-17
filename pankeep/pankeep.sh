. "$HOME""/automation/env.sh"

#"$SHELL" -c "$LOG \"Start\""
#"$SHELL" "$HOME""/pancake/pancake_startpage.sh"
WEBPAGE="$("$SHELL" "$HOME""/automation/utils_saveWebsite.sh")"
if [ "$(cat "$WEBPAGE" | grep Ladefehler)" ]; then
    echo bla
else
    echo blubb
fi
rm $WEBPAGE

#Leerlauf
#Reinigung
#if [ "$STATE" = "Lädt" ]; then
#	echo $BATTERYLEVEL
#else
#	echo a_$STATE
#fi