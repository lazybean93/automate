. "$HOME""/automation/env.sh"

"$SHELL" -c "$WAITLOADED_SILENT 1"
xte "keydown Control_L" "key P" "keyup Control_L"
"$SHELL" -c "$WAITLOADED_SILENT 1"
"$SHELL" -c "$KEY_RETURN" > /dev/zero 2>&1
xte 'str "$DOWNLOADS""/"error'
"$SHELL" -c "$WAITLOADED_SILENT 1"
"$SHELL" -c "$KEY_RETURN" > /dev/zero 2>&1
#find "$DOWNLOADS""/"* -type d -exec rm -r {} +
#RETURN="$(echo "$("$SHELL" "$HOME""/automation/utils_getNewestFile.sh" "$DOWNLOADS""/")" | grep '\.html$')"
#if [ -z "$RETURN" ]; then
#	RETURN="$(echo "$("$SHELL" "$HOME""/automation/utils_getNewestFile.sh" "$DOWNLOADS""/")")"
#fi
#echo "$RETURN"
