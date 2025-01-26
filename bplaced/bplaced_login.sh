. "$HOME""/automation/env.sh"

mail=`echo str "$(cat "$HOME""/bplaced/credentials.txt" | head -n1)"`
password=`echo str "$(cat "$HOME""/bplaced/credentials.txt" | tail -n1)"`

"$SHELL" -c "$LOG \"Start\""
sh "$HOME""/automation/utils_startpage.sh" "https://my.bplaced.net"
"$SHELL" -c "$LOG \"Enter Credentials\""
for i in $(seq 1 2); do
	xte 'key Tab'
done;
"$SHELL" -c "$WAITLOADED 1"
xte "$mail"
"$SHELL" -c "$WAITLOADED 1"
xte 'key Tab'
"$SHELL" -c "$WAITLOADED 1"
xte "$password"
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$LOG \"Interpret Webpage\""
"$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$WAITLOADED 1"
WEBPAGE=$(sh "$HOME""/automation/utils_saveWebsite.sh")
LAUFZEIT="$(cat "$WEBPAGE" | grep -A3 Laufzeit | tail -n1 | sed 's/ //g')"
"$SHELL" -c "$LOG \"$LAUFZEIT\""
sh "$HOME""/whatsapp/whatsapp_plannedMessage.sh" "Bplaced" "$LAUFZEIT"
"$SHELL" -c "$CLEAN"
"$SHELL" -c "$LOG \"End\""
