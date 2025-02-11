ID="$(tsp | grep finished | sort -r | grep pancake | sed 's/finished/\n/g' | grep -v [a-z] | sed 's/ //g' | head -n 1)"
if [ ! -z "$ID" ]; then
	tsp -r "$ID"
	"$SHELL" "$HOME""/automation/utils_cleanTspPancake.sh"
fi
