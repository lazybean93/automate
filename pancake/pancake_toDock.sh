. "$HOME""/automation/env.sh"

LEFTBUTTONX=$(($(($SCREENWIDTH/2))-50))
RIGHTBUTTONX=$(($(($SCREENWIDTH/2))+50))
UPPERROW=300;
ROWDELTA=50;
PREFIX="xte 'mousemove "
SUFFIX="' 'mouseclick 1'"
BUTTONSTART="$PREFIX$LEFTBUTTONX $(($UPPERROW+$ROWDELTA*0))$SUFFIX"
BUTTONSTOP="$PREFIX$LEFTBUTTONX $(($UPPERROW+$ROWDELTA*1))$SUFFIX"
BUTTONGOTO="$PREFIX$LEFTBUTTONX $(($UPPERROW+$ROWDELTA*3))$SUFFIX"

BUTTONPAUSE="$PREFIX$RIGHTBUTTONX $(($UPPERROW+$ROWDELTA*0))$SUFFIX"
BUTTONSTATION="$PREFIX$RIGHTBUTTONX $(($UPPERROW+$ROWDELTA*1))$SUFFIX"
BUTTONFIND="$PREFIX$RIGHTBUTTONX $(($UPPERROW+$ROWDELTA*3))$SUFFIX"

sh "$HOME""/pancake/pancake_startpage.sh"
xte "mousemove $(($SCREENWIDTH/11*10)) 720" 'mouseclick 1'
"$SHELL" -c "$WAITLOADED 1"
xte "mousemove $(($SCREENWIDTH/2)) 500" 'mouseclick 1'
"$SHELL" -c "$WAITLOADED 1"
xte "mousemove $(($SCREENWIDTH/11*10)) 270" 'mouseclick 1'
"$SHELL" -c "$WAITLOADED 1"
xte "mousemove $(($SCREENWIDTH/11*10)) 270" 'mouseclick 1'
"$SHELL" -c "$WAITLOADED 1"
xte "mousemove $LEFTBUTTONX 460" 'mouseclick 1'
"$SHELL" -c "$WAITLOADED 1"
xte 'keydown Alt_L' 'key Left' 'keyup Alt_L'
"$SHELL" -c "$WAITLOADED 1"
xte 'keydown Alt_L' 'key Left' 'keyup Alt_L'
expect "$HOME""/pancake/pancake_loadMap_ssh.sh" DOWN
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$BUTTONSTART"
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$BUTTONSTOP"
sleep 6
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$BUTTONSTATION"
sleep 6
"$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$CLEAN"
