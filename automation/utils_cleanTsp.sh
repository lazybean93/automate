ID="$(tsp | grep finished | sort -r | grep "$1" | grep -v ' -1 ' | sed 's/  finished   \/tmp\/ts-out\.[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]   0        [0-9]/\n/g' | tail -n 2 | head -n 1)"
echo $ID
if [ ! -z "$ID" ]; then
	tsp -r "$ID"
	sh "$HOME""/automation/utils_cleanTsp.sh" "$1"
fi
