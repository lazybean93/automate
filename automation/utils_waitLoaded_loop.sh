. "$HOME""/automation/env.sh"

for i in $(seq 1 $1); do
	sh -c "$LOG \"Loop $i of $1\""
	nice -n 19 sh "$HOME""/automation/utils_waitLoaded.sh"
done
