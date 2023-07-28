SPACE=$(df 2>/dev/zero | grep '/dev/sda1' | sed 's/ /\n/g' | tail -n 4 | head -n1)
echo "$SPACE"
echo "$1"
FOLDER="$HOME""/Downloads/"
while [ "$SPACE" -lt "$1" ]; do
	if [ ! -z "$(ls -t "$FOLDER" | tail -n1)" ]; then
		ls -t "$FOLDER" | tail -n1
		rm "$FOLDER""/""$(ls -t "$FOLDER" | tail -n1)"
		SPACE=$(df 2>/dev/zero | grep '/dev/sda1' | sed 's/ /\n/g' | tail -n 4 | head -n1)
	fi
done
