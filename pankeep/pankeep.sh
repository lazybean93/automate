. "$HOME""/automation/env.sh"

#"$SHELL" -c "$LOG \"Start\""
"$SHELL" "$HOME""/pancake/pancake_startpage.sh"
WEBPAGE="$("$SHELL" "$HOME""/automation/utils_saveWebsite.sh")"
if [ -n "$(cat "$WEBPAGE" | grep Ladefehler)" ]; then
    RIGHTBUTTONX=$(($(($SCREENWIDTH/2))+50))
    UPPERROW=300;
    ROWDELTA=50;
    PREFIX="xte 'mousemove "
    SUFFIX="' 'mouseclick 1'"
    CLOSEHINT="$PREFIX$(($SCREENWIDTH-30)) 125$SUFFIX"
    BUTTONSTATION="$PREFIX$RIGHTBUTTONX $(($UPPERROW+$ROWDELTA*1))$SUFFIX"

    #"$SHELL" -c "$LOG \"$CLOSEHINT\""
    "$SHELL" -c "$CLOSEHINT"
    sleep 2
    "$SHELL" -c "$BUTTONSTATION"
fi
rm "$WEBPAGE"

#Leerlauf
#Reinigung
#if [ "$STATE" = "Lädt" ]; then
#	echo $BATTERYLEVEL
#else
#	echo a_$STATE
#fi