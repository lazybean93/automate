. "$HOME""/automation/env.sh"

sh -c "$LOG Start"

TO="$1"
sh -c "$LOG \"$TO\""
sh -c "$LOG \"$2\""

sh "$HOME""/whatsapp/whatsapp_sendTo.sh" "$TO"
sh -c "$KEY_RETURN"
sh "$HOME""/automation/utils_writeString_wrapper.sh" "$2"
sh -c "$WAITLOADED 1"
sh -c "$KEY_RETURN"
sh -c "$WAITLOADED 2"
sh -c "$CLEAN"
sh -c "$LOG End"
exit 0
