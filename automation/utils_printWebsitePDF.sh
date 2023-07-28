. "$HOME""/automation/env.sh"

sh -c "$WAITLOADED_SILENT 1"
xte "keydown Control_L" "key P" "keyup Control_L"
sh -c "$WAITLOADED_SILENT 1"
sh -c "$KEY_RETURN" > /dev/zero 2>&1
xte 'str "$HOME""/Downloads/"error'
sh -c "$WAITLOADED_SILENT 1"
sh -c "$KEY_RETURN" > /dev/zero 2>&1
#find "$HOME""/Downloads/"* -type d -exec rm -r {} +
#RETURN="$(echo "$(sh "$HOME""/automation/utils_getNewestFile.sh" "$HOME""/Downloads/")" | grep '\.html$')"
#if [ -z "$RETURN" ]; then
#	RETURN="$(echo "$(sh "$HOME""/automation/utils_getNewestFile.sh" "$HOME""/Downloads/")")"
#fi
#echo "$RETURN"
