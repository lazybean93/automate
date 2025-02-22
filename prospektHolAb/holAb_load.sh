. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Start\""
LINKS="$(wget "https://www.holab.de/" -O /dev/stdout 2> /dev/null | sed 's/ /\n/g' | grep -B 1 mehr | grep href | sed 's/href="/https:\/\/www.holab.de/g' | sed 's/"//g')"
"$SHELL" -c "$LOG \"$LINKS\""

PROSPEKTE="$(for i in $LINKS; do wget $i -O /dev/stdout 2>/dev/null | sed 's/ /\n/g' | grep https | sed 's/href="//g' | sed 's/"//g' | sed 's/#p=1//g'; done | sort | uniq)"
"$SHELL" -c "$LOG \"$PROSPEKTE\""

for i in $PROSPEKTE; do
	if [ ! -z "$(echo $i | grep '\.pdf')" ]; then
		"$SHELL" -c "$LOG \"$i is a PDF\""
		wget "$i" -P "$HOME""/Downloads" -o /dev/stdout | sed 's/‘/\n/g' | grep '\.pdf' | sed 's/’/\n/g' | grep '\.pdf' | tail -n1
		"$SHELL" "$HOME""/automation/utils_fdupes.sh" "$HOME""/Downloads" > /dev/null
		"$SHELL" "$HOME""/automation/utils_sendIfNew.sh" "HolAb Prospekte"
	else
		"$SHELL" -c "$LOG \"$i is not a PDF\""
		"$SHELL" "$HOME""/automation/utils_startpage.sh" $i
		WEBPAGE="$("$SHELL" "$HOME""/automation/utils_saveWebsite.sh")"
		"$SHELL" -c "$LOG \"WEBPAGE $WEBPAGE \""
		cat "$WEBPAGE" | sed 's/"/\n/g' | grep pdf
		PDF="$(cat "$WEBPAGE" | sed 's/ /\n/g' | grep pdf | grep 'files/downloads' | sed 's/value=".\///' | sed 's/"//')"
		MAIN="$(for j in $(seq 1 $(($(echo "$i" | sed 's/\//\n/g' | wc -l)-1))); do echo "$(echo "$i" | sed 's/\//\n/g' | head -n $j | tail -n1)"/; done)";
		MAINLINK="$(echo $MAIN | sed 's/ //g')"
		echo "$MAINLINK""$PDF"
		rm "$WEBPAGE"
		wget "$MAINLINK""$PDF" -P "$HOME""/Downloads" -o /dev/stdout | sed 's/‘/\n/g' | grep '\.pdf' | sed 's/’/\n/g' | grep '\.pdf' | tail -n1
		"$SHELL" "$HOME""/automation/utils_fdupes.sh" "$HOME""/Downloads" > /dev/null
		"$SHELL" "$HOME""/automation/utils_sendIfNew.sh" "HolAb Prospekte"
	fi
done
"$SHELL" -c "$LOG \"End\""
