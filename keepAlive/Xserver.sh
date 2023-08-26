if [ -n "$(cat "$HOME""/.local/share/xorg/Xorg.0.log" | grep "Fatal server error:")" ]; then
	"$HOME""/keepAlive/reboot"
fi
