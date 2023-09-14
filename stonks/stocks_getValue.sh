# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

. "$HOME""/automation/env.sh"

sh -c "$LOG \"Start\""
DATE="$(sh "$HOME""/automation/utils_getDate_ymd_hms.sh")"
FILE="$SCRIPTPATH""/stocks.txt"
SUFFIX=".htmlstonks"

for i in $(cat "$FILE" | head -n 100); do
        INDEX="$(echo $i | tr -d '\r')"
        sh -c "$LOG \"$i\""
        tsp python3 "$SCRIPTPATH""/selenium_loader.py" "https://wertpapiere.ing.de/Investieren/Aktie/""$INDEX" "$SCRIPTPATH""/""$INDEX""$SUFFIX" "Aktien-Suche"
done
tsp -w
for i in $(ls *"$SUFFIX"); do
        FUNDAMENTALS1="$(cat "$i" | grep '<tbody><tr name="Bid"' | sed 's/EUR/EUR\r\n/g' | sed 's/>/\r\n/g' | grep 'Geldkurs\|Briefkurs\|Tages\|52-Wochen\|EUR' | sed 's/<\/td//g')"
        FUNDAMENTALS2="$(cat "$i" | grep '<div name="DividendYield">' | sed 's/%/%\r\n/g' | sort | uniq | sed 's/<span class="label">/\r\n/g' | sed 's/</\r\n/g;s/>/\r\n/g' | grep 'Dividendenrendite\|Kurs\|[0-9]>
        echo "$(echo "$i"";""$(echo "$FUNDAMENTALS1"'\r\n'"$FUNDAMENTALS2" | grep -v [a-z] | sed 's/ EUR//g')" | tr -s '\r\n' ';')" "" >> "$SCRIPTPATH""/""$DATE"".csv"
done
sh -c "$CLEAN"
sh -c "$LOG \"End\""
