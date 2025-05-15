export AUTOMATION="$HOME""/automation"
export DISPLAY="$(ps aux | grep -v grep | grep -i 'Xorg\|Xtightvnc' | sed 's/ :/\n:/g' | tail -n1 | sed 's/ /\n/g' | head -n1)"
export SHELL="/bin/bash"

export CLEAN="$SHELL"" ""$AUTOMATION""/utils_clean.sh"
export CLEAN_DIRTY="$SHELL"" ""$AUTOMATION""/utils_clean_dirty.sh"
export KEY_RETURN="$SHELL"" ""$AUTOMATION""/utils_sendkey_Return.sh"
export KEY_TAB="xte \"key Tab\""
export HIDEFILE="/dev/zero"
export HIDEFILE_CHECK_DELETE="$SHELL"" ""$AUTOMATION""/utils_hidefile_check_delete.sh"
export LOG="$SHELL"" ""$AUTOMATION""/utils_log.sh $0"

SCREENRESOLUTION="$(ps aux | grep -v grep | grep -i Xtightvnc | sed 's/ -geometry /\n/g' | tail -n1 | sed 's/ /\n/g' | head -n1 | sed 's/x/\n/g')"
if [ -n "$SCREENRESOLUTION" ]; then
	export SCREENHEIGHT=$(echo "$SCREENRESOLUTION" | tail -n 1)
	export SCREENWIDTH=$(echo "$SCREENRESOLUTION" | head -n 1)
else
	export SCREENHEIGHT=$(xrandr | head -n1 | sed 's/current /\n/' | tail -n1 | sed 's/, /\n/g' | head -n1 | sed 's/ x /\n/' | head -n2 | tail -n 1)
	export SCREENWIDTH=$(xrandr | head -n1 | sed 's/current /\n/' | tail -n1 | sed 's/, /\n/g' | head -n1 | sed 's/ x /\n/' | head -n1)
fi

export WAITLOADED="nice -n 19 sh ""$AUTOMATION""/utils_waitLoaded_loop.sh"
export WAITLOADED_SILENT="nice -n 19 sh ""$AUTOMATION""/utils_waitLoaded_loop_silent.sh"

export DOWNLOADS="$HOME""/Downloads"

export KEY_SEARCH="xte \"keydown Control_L\" \"key F\" \"keyup Control_L\""
export KEY_ESCAPE="xte \"key Escape\""
