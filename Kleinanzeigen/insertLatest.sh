. "$HOME""/automation/env.sh"

#mail=`echo str "$(cat "$HOME""/bplaced/credentials.txt" | head -n1)"`
#password=`echo str "$(cat "$HOME""/bplaced/credentials.txt" | tail -n1)"`

sh -c "$LOG \"Start\""
sh "$HOME""/automation/utils_startpage.sh" "https://kleinanzeigen.de"
sh -c "$LOG \"Enter Credentials\""
#for i in $(seq 1 2); do
#	xte 'key Tab'
#done;
#sh -c "$WAITLOADED 1"
#xte "$mail"
#sh -c "$WAITLOADED 1"
#xte 'key Tab'
#sh -c "$WAITLOADED 1"
#xte "$password"
#sh -c "$WAITLOADED 1"
#sh -c "$LOG \"Interpret Webpage\""
#sh -c "$KEY_RETURN"
#sh -c "$WAITLOADED 1"
#WEBPAGE=$(sh "$HOME""/automation/utils_saveWebsite.sh")
#LAUFZEIT="$(cat "$WEBPAGE" | grep -A3 Laufzeit | tail -n1 | sed 's/ //g')"
#sh -c "$LOG \"$LAUFZEIT\""
#sh "$HOME""/whatsapp/whatsapp_plannedMessage.sh" "Bplaced" "$LAUFZEIT"
#sh -c "$CLEAN"
#sh -c "$LOG \"End\""
