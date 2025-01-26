# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

. "$HOME""/automation/env.sh"

DATE="$SCRIPTPATH""/""$(sh "$HOME""/automation/utils_getDate_ymd_hms.sh")"
mkdir "$DATE"

SUFFIX=".htmlstonks"
PAGEPART="https://wertpapiere.ing.de/Investieren/Suche/Aktien?v=Ergebnisse&s="

PAGETITLE="Aktien-Suche"

for j in {A..Z}; do
	FILENAME="$DATE""/""$j"
	FILE="$FILENAME""$SUFFIX"
	PAGE="$PAGEPART""$j"

	echo "$PAGE"
	tsp python3 "$SCRIPTPATH""/""selenium_loader.py" "$PAGE" "$FILE" "$PAGETITLE"
	tsp -w
done

for j in {A..Z}; do
	FILENAME="$DATE""/""$j"
	FILE="$FILENAME""$SUFFIX"
	MAX="$(cat $FILE | grep paging-nav-element | sed 's/paging-nav-element\"> /\r\n/g' | tail -n1 | sed 's/ /\n/g' | head -n1 | sed 's/\.//g'; rm $FILE)"

	PAGE="$PAGEPART""$j"
	for i in $(seq 1 $MAX); do
		echo "$PAGE""&p=""$i"
		FILENAME_LOCAL="$FILENAME""-""$i""$SUFFIX"
		tsp python3 "$SCRIPTPATH""/""selenium_loader.py" "$PAGE""&p=""$i" "$FILENAME_LOCAL" "$PAGETITLE"
		tsp -w
		tsp "$SHELL" -c "cat "$FILENAME_LOCAL" | grep 'CAD\|EUR\|USD' > tmp; mv tmp "$FILENAME_LOCAL""
		tsp -w
	done
done
