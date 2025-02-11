ID="$(tsp | grep finished | sort -r | grep whatsapp_plannedMessage | sed 's/  finished   \/tmp\/ts-out\.[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]   0        [0-9]/\n/g' | tail -n 2 | head -n 1)"
if [ ! -z "$ID" ]; then
	tsp -r "$ID"
	"$SHELL" $0
fi
