. "$HOME""/automation/env.sh"

sh -c "$WAITLOADED_SILENT 1"
xte "keydown Control_L" "key S" "keyup Control_L"
sh "$HOME""/automation/utils_waitSaveAsDialog.sh" > /dev/zero 2>&1
sh -c "$KEY_RETURN" > /dev/zero 2>&1
find "$HOME""/Downloads/"* -type d -exec rm -r {} +
RETURN="$(echo "$(sh "$HOME""/automation/utils_getNewestFile.sh" "$HOME""/Downloads/")" | grep '\.html$')"
if [ -z "$RETURN" ]; then
	RETURN="$(echo "$(sh "$HOME""/automation/utils_getNewestFile.sh" "$HOME""/Downloads/")")"
fi
echo "$RETURN"
