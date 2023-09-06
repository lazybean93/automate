# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

. "$HOME""/automation/env.sh"


PAGEPART="https://wertpapiere.ing.de/Investieren/Suche/Aktien?v=Ergebnisse&s="

for j in {A..Z}; do
	FILENAME="$SCRIPTPATH""/""$j"
	FILE="$FILENAME"".html"
	PAGE="$PAGEPART""$j"

	echo "$PAGE"
	tsp python3 "$SCRIPTPATH""/""loader.py" "$PAGE" "$FILE"
done

tsp -w

for j in {A..Z}; do
	FILENAME="$SCRIPTPATH""/""$j"
	FILE="$FILENAME"".html"
	MAX="$(cat $FILE | grep paging-nav-element | sed 's/paging-nav-element\"> /\r\n/g' | tail -n1 | sed 's/ /\n/g' | head -n1 | sed 's/\.//g'; rm $FILE)"

	PAGE="$PAGEPART""$j"
	for i in $(seq 1 $MAX); do
		echo "$PAGE""&p=""$i"
		tsp python3 "$SCRIPTPATH""/""loader.py" "$PAGE""&p=""$i" "$FILENAME""-""$i"".html"
	done
done
