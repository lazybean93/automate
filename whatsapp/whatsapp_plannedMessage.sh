. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG Start"

TO="$1"
"$SHELL" -c "$LOG \"$TO\""
"$SHELL" -c "$LOG \"$2\""

sh "$HOME""/whatsapp/whatsapp_sendTo.sh" "$TO"
"$SHELL" -c "$KEY_RETURN"
sh "$HOME""/automation/utils_writeString_wrapper.sh" "$2"
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$WAITLOADED 2"
"$SHELL" -c "$CLEAN"
"$SHELL" -c "$LOG End"
exit 0
