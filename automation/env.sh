export DISPLAY=:0

export CLEAN="sh ""$HOME""/automation/utils_clean.sh"
export KEY_RETURN="sh ""$HOME""/automation/utils_sendkey_Return.sh"
export HIDEFILE="/dev/zero"
export HIDEFILE_CHECK_DELETE="sh ""$HOME""/automation/utils_hidefile_check_delete.sh"
export LOG="sh ""$HOME""/automation/utils_log.sh $0"
export SCREENHEIGHT=$(xrandr | head -n1 | sed 's/current /\n/' | tail -n1 | sed 's/, /\n/g' | head -n1 | sed 's/ x /\n/' | head -n2 | tail -n 1)
export SCREENWIDTH=$(xrandr | head -n1 | sed 's/current /\n/' | tail -n1 | sed 's/, /\n/g' | head -n1 | sed 's/ x /\n/' | head -n1)
export WAITLOADED="nice -n 19 sh ""$HOME""/automation/utils_waitLoaded_loop.sh"
export WAITLOADED_SILENT="nice -n 19 sh ""$HOME""/automation/utils_waitLoaded_loop_silent.sh"