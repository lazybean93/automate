. "$HOME""/automation/env.sh"

sh -c "$WAITLOADED_SILENT 1"
xte "keydown Control_L" "key P" "keyup Control_L"
sh -c "$WAITLOADED_SILENT 1"
sh -c "$KEY_RETURN" > /dev/zero 2>&1
xte 'str "$DOWNLOADS""/"error'
sh -c "$WAITLOADED_SILENT 1"
sh -c "$KEY_RETURN" > /dev/zero 2>&1
#find "$DOWNLOADS""/"* -type d -exec rm -r {} +
#RETURN="$(echo "$(sh "$HOME""/automation/utils_getNewestFile.sh" "$DOWNLOADS""/")" | grep '\.html$')"
#if [ -z "$RETURN" ]; then
#	RETURN="$(echo "$(sh "$HOME""/automation/utils_getNewestFile.sh" "$DOWNLOADS""/")")"
#fi
#echo "$RETURN"
