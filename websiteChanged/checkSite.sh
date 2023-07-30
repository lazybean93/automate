#!/usr/bin/env sh
. "$HOME""/automation/env.sh"

FOLDER="$HOME""/Downloads/"
SUFFIX=".html"

gotBadword () {
	sh -c "$LOG \"Got $1\""
	mv "$FOLDER""$FILENAME""$SUFFIX" "$FOLDER""$FILENAME"_temp_"$SUFFIX"
	cat "$FOLDER""$FILENAME"_temp_"$SUFFIX" | sed "s/$2//g" > "$FOLDER""$FILENAME""$SUFFIX"
	rm "$FOLDER""$FILENAME"_temp_"$SUFFIX"
	echo $2
}

sh -c "$LOG \"Start\""
for i in $(cat "$HOME""/websiteChanged/websites.txt"); do
	if [ ! -z "$(echo $i | grep '#http')" ]; then
		continue
	fi
	FILENAME=$(echo "$i"_"$(date +%Y%m%d_%H%M%S%N)"  | sed 's/:/_/g' | sed 's/\//_/g' | sed 's/\./_/g'  | sed 's/__/_/g' | sed 's/__/_/g')
	LOGVAR="FILENAME: ""$FOLDER""$FILENAME""$SUFFIX"; sh -c "$LOG \"$LOGVAR\""
	wget "$i" -O "$FOLDER""$FILENAME""$SUFFIX" > /dev/zero 2>&1
	BADWORD_1=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '\?ver=[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' | tail -n1 | sed 's/\?ver=/\n/g' | tail -n1 | sed "s/'/\n/" | head -n1)
	BADWORD_2=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep handle | sed 's/"handle":"/\n/g' | tail -n1 | sed 's/"}/\n/g' | head -n1)
	BADWORD_3=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '<b>E-Mail:</b>' | head -n1)
	BADWORD_4=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep 'csrf.token":"' | sed 's/csrf.token":"/\n/g' | grep system.path | sed 's/","/\n/g' | head -n1)
	BADWORD_5=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep cacheJsKey | sed 's/cacheJsKey":"/\n/g' | grep jimstatic | sed 's/","/\n/g' | head -n1)
	BADWORD_6=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep em-view | sed 's/"/\n/g' | grep '[0-9]' | sed 's/em-view-//g')
	BADWORD_7=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '/jetpack/' | head -n1 | sed 's/\//\n/g' | grep -v [a-z] | grep [0-9])
	BADWORD_8=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep stats.wp | sed 's/e-/\n/g' | sed 's/\.js/\n/g' | grep [0-9])
	BADWORD_9=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep 'banners-' | sed 's/"/\n/g' | grep -v ' \|></div>' | sed 's/banners-//g')
	BADWORD_10=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep 'Site Kit' | sed 's/"/\n/g' | grep 'Site Kit')
	BADWORD_11=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n1 | tail -n1)
	BADWORD_12=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n2 | tail -n1)
	BADWORD_13=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n3 | tail -n1)
	BADWORD_14=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n4 | tail -n1)
	BADWORD_15=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n5 | tail -n1)
	BADWORD_16=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n6 | tail -n1)
	BADWORD_17=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n7 | tail -n1)
	BADWORD_18=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n8 | tail -n1)
	BADWORD_19=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n9 | tail -n1)
	BADWORD_20=$(cat "$FOLDER""$FILENAME""$SUFFIX" | grep '[0-9]"></script>' | sed 's/?/\n/g' | sed 's/"/\n/g' | grep -v '[a-z]\|-' | sort | uniq | head -n10 | tail -n1)
	if [ ! -z "$BADWORD_1" ]; then
		gotBadword BADWORD_1 $BADWORD_1
	fi
	if [ ! -z "$BADWORD_2" ]; then
		gotBadword BADWORD_2 $BADWORD_2
	fi
	if [ ! -z "$BADWORD_3" ]; then
		gotBadword BADWORD_3 $BADWORD_3
	fi
	if [ ! -z "$BADWORD_4" ]; then
		gotBadword BADWORD_4 $BADWORD_4
	fi
	if [ ! -z "$BADWORD_5" ]; then
		gotBadword BADWORD_5 $BADWORD_5
	fi
	if [ ! -z "$BADWORD_6" ]; then
		gotBadword BADWORD_6 $BADWORD_6
	fi
	if [ ! -z "$BADWORD_7" ]; then
		gotBadword BADWORD_7 $BADWORD_7
	fi
	if [ ! -z "$BADWORD_8" ]; then
		gotBadword BADWORD_8 $BADWORD_8
	fi
	if [ ! -z "$BADWORD_9" ]; then
		gotBadword BADWORD_9 $BADWORD_9
	fi
	if [ ! -z "$BADWORD_10" ]; then
		gotBadword BADWORD_10 $BADWORD_10
	fi
	if [ ! -z "$BADWORD_11" ]; then
		gotBadword BADWORD_11 $BADWORD_11
	fi
	if [ ! -z "$BADWORD_12" ]; then
		gotBadword BADWORD_12 $BADWORD_12
	fi
	if [ ! -z "$BADWORD_13" ]; then
		gotBadword BADWORD_13 $BADWORD_13
	fi
	if [ ! -z "$BADWORD_14" ]; then
		gotBadword BADWORD_14 $BADWORD_14
	fi
	if [ ! -z "$BADWORD_15" ]; then
		gotBadword BADWORD_15 $BADWORD_15
	fi
	if [ ! -z "$BADWORD_16" ]; then
		gotBadword BADWORD_16 $BADWORD_16
	fi
	if [ ! -z "$BADWORD_17" ]; then
		gotBadword BADWORD_17 $BADWORD_17
	fi
	if [ ! -z "$BADWORD_18" ]; then
		gotBadword BADWORD_18 $BADWORD_18
	fi
	if [ ! -z "$BADWORD_19" ]; then
		gotBadword BADWORD_19 $BADWORD_19
	fi
	if [ ! -z "$BADWORD_20" ]; then
		gotBadword BADWORD_20 $BADWORD_20
	fi
	mv "$FOLDER""$FILENAME""$SUFFIX" "$FOLDER""$FILENAME""$SUFFIX"".pdf"
	sh "$HOME""/automation/utils_fdupes.sh" "$FOLDER"
	sh -c "$LOG \"After fdupes\""
	if [ -f "$FOLDER""$FILENAME""$SUFFIX"".pdf" ]; then
		#COMPAREFILE="$(ls -t "$FOLDER"* | grep $(echo $FILENAME | sed 's/_[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]_[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/\n/g' | head -n1) | head -n2 | tail -n1)"
		#DIFFERENCES="$(wdiff --no-common "$COMPAREFILE" "$FOLDER""$FILENAME""$SUFFIX"".pdf" | grep -vx '=*')"
		#MESSAGE="$(echo "$i"; echo ""; echo "$DIFFERENCES")"
		#sh "$HOME""/whatsapp/whatsapp_plannedMessage.sh" "Webseiten" "$MESSAGE"
		sh "$HOME""/whatsapp/whatsapp_plannedMessage.sh" "Webseiten" "$i"
	fi
done
sh -c "$LOG \"End\""
