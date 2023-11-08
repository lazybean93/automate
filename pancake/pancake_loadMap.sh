. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
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

sh -c "$LOG \"Reset Map\""
sh "$HOME""/pancake/pancake_startpage.sh"
xte "mousemove $(($SCREENWIDTH/11*10)) 720" 'mouseclick 1'
sh -c "$WAITLOADED 1"
xte "mousemove $(($SCREENWIDTH/2)) 500" 'mouseclick 1'
sh -c "$WAITLOADED 1"
xte "mousemove $(($SCREENWIDTH/11*10)) 270" 'mouseclick 1'
sh -c "$WAITLOADED 1"
xte "mousemove $(($SCREENWIDTH/11*10)) 270" 'mouseclick 1'
sh -c "$WAITLOADED 1"
xte "mousemove $LEFTBUTTONX 460" 'mouseclick 1'
sh -c "$WAITLOADED 1"
xte 'keydown Alt_L' 'key Left' 'keyup Alt_L'
sh -c "$WAITLOADED 1"
xte 'keydown Alt_L' 'key Left' 'keyup Alt_L'
sh -c "$LOG \"Set Map $1\""
rm -r "$HOME""/.ssh"
expect "$HOME""/pancake/pancake_loadMap_ssh.sh" $1
rm -r "$HOME""/.ssh"
sh -c "$WAITLOADED 1"
sh -c "$BUTTONSTART"
sh -c "$WAITLOADED 1"
sleep 8
sh -c "$BUTTONSTOP"
sh -c "$WAITLOADED 1"
sh -c "$CLEAN"
sh -c "$LOG \"End\""
