. "$HOME""/automation/env.sh"

FOLDER="$HOME""/Downloads/"
SUFFIX=".html"

"$SHELL" -c "$LOG \"Start\""
sh "$HOME""/automation/utils_startpage.sh" http://192.168.178.37:9925/recipes/all

for i in $(seq 1 10); do
	xte "key Page_Down"
done

WEBPAGE="$("$SHELL" "$HOME""/automation/utils_saveWebsite.sh")"
LIST="$(cat "$WEBPAGE" | sed 's/"/\n/g' | grep http | grep '/recipe/' | sort)"

rm -r "$WEBPAGE"
for i in $(echo "$LIST" | sed 's/ /\n/g'); do
	"$SHELL" -c "$LOG \"$i\""
	"$SHELL" "$HOME""/automation/utils_startpage.sh" "$i"
	WEBPAGE="$("$SHELL" "$HOME""/automation/utils_saveWebsite.sh")"
	#LIST="$(cat "$WEBPAGE" | sed 's/<\/p>/\n/g;s/<\/p>/\n/g' | sed 's/Zutaten/\n/g' | grep '<li><span aria-hidden' | sed 's/<p>/\n/g' | grep -v '<li><span aria-hidden' | sed 's/^Optional //g;s/^Etwas //g;s/^Prise //g;s/^[0-9]//g;s/^\///g;s/^[0-9]//g;s/^[0-9]//g;s/^ //g;s/^kg //g;s/^g //g;s/^Bund //g;s/^Gläser //g;s/^Glas //g;s/^Pkg. //g;s/^TL //g;s/^EL //g;s/^gestr. //g;s/^ml //g;s/^l //g' | sort | uniq)"
	LIST="$(cat "$WEBPAGE" | sed 's/<\/p>/\n/g;s/<\/p>/\n/g' | sed 's/Zutaten/\n/g' | grep '<li><span aria-hidden' | sed 's/<p>/\n/g' | grep -v '<li><span aria-hidden')"
	LIST="$(echo "$LIST" | sed 's/^Optional //g')"
	LIST="$(echo "$LIST" | sed 's/^bis zu //g')"
	for j in $(seq 1 3); do
		LIST="$(echo "$LIST" | sed 's/^[0-9]//g')";
	done;
	LIST="$(echo "$LIST" | sed 's/^\///g')"
	LIST="$(echo "$LIST" | sed 's/^[0-9]//g')";
	LIST="$(echo "$LIST" | sed 's/^ //g')"
	LIST="$(echo "$LIST" | sed 's/^Etwas //g;s/^Prise //g')"
	LIST="$(echo "$LIST" | sed 's/^Stück //g')"
	LIST="$(echo "$LIST" | sed 's/^kg //g;s/^g //g;s/^Bund //g;s/^Dose //g;s/^Gläser //g;s/^Glas //g;s/^Tassen //g;s/^Pkg. //g;s/^TL //g;s/^EL //g;s/^gestr. //g;s/^ml //g;s/^l //g' | sort | uniq)"

	rm -r "$WEBPAGE"
	FILENAME=$(echo "$i"_"$(date +%Y%m%d_%H%M%S%N)"  | sed 's/:/_/g;s/\//_/g;s/\./_/g;s/__/_/g;s/__/_/g;s/_recipe_/\n/g' | tail -n1)
	echo "$LIST" > "$FOLDER""$FILENAME""$SUFFIX"".pdf"
	"$SHELL" "$HOME""/automation/utils_fdupes.sh" "$HOME""/Downloads"
done

"$SHELL" -c "$CLEAN"
"$SHELL" -c "$LOG \"End\""
