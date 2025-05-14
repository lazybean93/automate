. "$HOME""/automation/env.sh"

#"$SHELL" -c "$WAITLOADED_SILENT 1"
sleep 0.1

xte "keydown Control_L" "key S" "keyup Control_L"
"$SHELL" "$HOME""/automation/utils_waitSaveAsDialog.sh" > /dev/zero 2>&1
"$SHELL" -c "$KEY_RETURN" > /dev/zero 2>&1
find "$DOWNLOADS""/"* -type d -exec rm -r {} +
RETURN="$(echo "$("$SHELL" "$HOME""/automation/utils_getNewestFile.sh" "$DOWNLOADS""/")" | grep '\.html$')"
if [ -z "$RETURN" ]; then
	RETURN="$(echo "$("$SHELL" "$HOME""/automation/utils_getNewestFile.sh" "$DOWNLOADS""/")")"
fi
echo "$RETURN"
