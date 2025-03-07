#!/bin/bash

. "$HOME""/automation/env.sh"

function keyReturn {
	"$SHELL" -c "$KEY_RETURN"; sh "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
}

function keyTab {
	"$SHELL" -c "$KEY_TAB"
}

function waitloaded_1 {
	"$SHELL" -c "$WAITLOADED 1"
}

function strg_f {
	xte "keydown Control_L" "key F" "keyup Control_L"
    waitloaded_1
}

function keyEscape {
	xte "key Escape"
	waitloaded_1
}

function fail {
	RESULT="$DOWNLOADS""/res_""$(date +%s)"".log"
        	echo "$TITLE" >> $RESULT
			echo "" >> $RESULT
        	echo "$PRICE" >> $RESULT
			echo "" >> $RESULT
        	echo "$SHIPPING" >> $RESULT
			echo "" >> $RESULT
        	echo "$DESCRIPTION" >> $RESULT
			echo "" >> $RESULT
        	echo "$CATEGORY" >> $RESULT
	sleep infinity
}

mail=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | head -n1)"`
password=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | tail -n1)"`

"$SHELL" -c "$LOG \"Start\""
	"$SHELL" "$HOME""/automation/utils_startpage.sh" "https://kleinanzeigen.de"
 	strg_f
 	xte "str tippen sie zum Ablehnen bitte hier"
 	waitloaded_1
 	keyEscape
 	keyReturn
 "$SHELL" -c "$LOG \"Enter Credentials\""
 	for i in $(seq 1 5); do
 		keyTab
 	done;
 	waitloaded_1
 	keyReturn
 	xte "$mail"
 	waitloaded_1
 	keyTab
 	waitloaded_1
 	xte "$password"
 	waitloaded_1
 	for i in $(seq 1 2); do
 		keyTab
 	done;
 	waitloaded_1
 	keyReturn
 "$SHELL" -c "$LOG \"\""
 "$SHELL" -c "$LOG \"Get to last Item\""
  "$SHELL" -c "$LOG \"1. Search 'kleinanzeigen'\""
 	strg_f
 	xte "str Kleinanzeigen"
 	waitloaded_1
  "$SHELL" -c "$LOG \"   Escape Dialog\""
 	keyEscape
  "$SHELL" -c "$LOG \"   Reverse Tab x2\""
 	for i in $(seq 1 2); do
 	        xte "keydown Shift_L" "key Tab" "keyup Shift_L"
 	done;
 	waitloaded_1
  "$SHELL" -c "$LOG \"   Hit Return\""
 	keyReturn
 	waitloaded_1
  "$SHELL" -c "$LOG \"2. Search 'Endet'\""
 	strg_f
 	xte "key BackSpace"
 	waitloaded_1
 	xte "str Endet"
 	waitloaded_1
  "$SHELL" -c "$LOG \"   Tab\""
 	keyTab
 	waitloaded_1
  "$SHELL" -c "$LOG \"   Hit Return\""
 	keyReturn
  "$SHELL" -c "$LOG \"   Escape Dialog\""
 	keyEscape
  "$SHELL" -c "$LOG \"   Reverse Tab\""
 	xte "keydown Shift_L" "key Tab" "keyup Shift_L"
 	waitloaded_1
  "$SHELL" -c "$LOG \"   Hit Return\""
 	keyReturn
  "$SHELL" -c "$LOG \"3. Save Item Page\""
 	WEBPAGE="$("$SHELL" "$HOME""/automation/utils_saveWebsite.sh")"
#   "$SHELL" -c "$LOG \"4. Remove Item\""
#  	strg_f
#  	xte "str Löschen"
#  	waitloaded_1
#  	keyEscape
#  	keyReturn
#  	strg_f
#  	xte "str Ja, Anzeige löschen"
#  	waitloaded_1
#  	keyEscape
#  	for i in $(seq 1 2); do
#  		keyTab
#  	done
#  	keyReturn
#  	strg_f
#  	xte "str Schließen"
#  	waitloaded_1
#  	keyEscape
#  	for i in $(seq 1 2); do
#  		keyTab
#  	done
#  	keyReturn
	
 "$SHELL" -c "$LOG \"Analyze Webpage\""
  "$SHELL" -c "$LOG \"1. Pictures\""
	PICTURES=$(cat "$WEBPAGE" | sed 's/ /\n/g' | grep "data-imgsrc=" | sed 's/"/\n/g' | grep "http" | grep "_57.AUTO")
	cat $PICTURES
	digit=0;
	for i in $PICTURES; do
		echo $i
		output=$(printf "%02d.jpg" $digit)
		wget $i -O "$DOWNLOADS""/""$output"
		digit=$(($digit+1))
	done
  "$SHELL" -c "$LOG \"2. Title\""
        TITLE="$(cat "$WEBPAGE" | grep 'itemName: "' | sed 's/itemName: "/\n/g' | grep ',$' | sed 's/",//g' | sed 's/\&amp;/\&/g')"
  "$SHELL" -c "$LOG \"3. Price\""
        PRICE="$(cat "$WEBPAGE" | grep '€</h2>' | sed 's/ //g;s/€<\/h2>//g')"
  "$SHELL" -c "$LOG \"4. Shipping\""
        SHIPPING="$(cat "$WEBPAGE" | grep boxedarticle--details--shipping | sed 's/> /\n/g;s/<\/span>//g' | grep -v boxedarticle--details--shipping | sed 's/\&amp;/\&/g')"
  "$SHELL" -c "$LOG \"5. Description\""
        DESCRIPTION="$(cat "$WEBPAGE" | grep -A1 'itemprop="description">' | grep -v 'itemprop="description">' | xargs | sed 's/<\/p>//g;s/<br>/\n/g' | sed 's/\&amp;/\&/g')"
  "$SHELL" -c "$LOG \"6. Category\""
        CATEGORY="$(cat "$WEBPAGE" | grep breadcrump-link | sed 's/title">/\n/g;s/<\/span><\/a>//g' | grep -v '<a class' | sed 's/\&amp;/\&/g'; cat "$WEBPAGE" | grep -C1 'Art<span' | tail -n1 | sed 's/    //g;s/<\/span>//g;s/\&amp;/\&/g')"

"$SHELL" -c "$LOG \"Insert item\""
 "$SHELL" -c "$LOG \"1. Open \"Anzeige Aufgeben\"\""
        strg_f
        xte "str Inserieren"
        waitloaded_1
        keyEscape
		keyReturn
 "$SHELL" -c "$LOG \"2. Enter Title\""
        strg_f
        xte "str Titel"
        waitloaded_1
        keyEscape
        keyTab
        waitloaded_1
        xte "str ""$TITLE"
 "$SHELL" -c "$LOG \"3. Category\""
		if [ "$(echo "$CATEGORY" | head -n 1)" == "Auto, Rad & Boot"  ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Dienstleistungen" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Eintrittskarten & Tickets"  ] || [  \
			"$(echo "$CATEGORY" | head -n 1)" == "Elektronik" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Familie, Kind & Baby" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Freizeit, Hobby & Nachbarschaft" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Haus & Garten" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Haustiere" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Immobilien" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Jobs" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Mode & Beauty" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Musik, Filme & Bücher" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Nachbarschaftshilfe" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Unterricht & Kurse" ] || [ \
			"$(echo "$CATEGORY" | head -n 1)" == "Verschenken & Tauschen" ];
		then
        	strg_f
        	xte "str Titel"
        	waitloaded_1
        	keyEscape
			for i in $(seq 1 2); do
        		keyTab
			done
			waitloaded_1
			keyReturn
			waitloaded_1
			strg_f
        	xte "str ""$(echo "$CATEGORY" | head -n 1)"
			waitloaded_1
        	keyEscape
			keyReturn
			if [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Reparaturen & Dienstleistungen" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weiteres Auto, Rad & Boot" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Altenpflege" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Auto, Rad & Boot" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Babysitter/-in & Kinderbetreuung" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Elektronik" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Haus & Garten" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Reise & Event" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Tierbetreuung & Training" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Umzug & Transport" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weitere Dienstleistungen" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Bahn & ÖPNV" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Comedy & Kabarett" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Gutscheine" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Kinder" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Konzerte" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Sport" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Theater & Musical" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weitere Eintrittskarten & Tickets" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Dienstleistungen Elektronik" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Notebooks" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "PCs" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weitere Elektronik" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Altenpflege" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Baby-Ausstattung" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Babyschalen & Kindersitze" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Babysitter/-in & Kinderbetreuung" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Kinderwagen & Buggys" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weiteres Familie, Kind & Baby" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Esoterik & Spirituelles" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Essen & Trinken" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Freizeitaktivitäten" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Handarbeit, Basteln & Kunsthandwerk" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Kunst & Antiquitäten" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Künstler/-in & Musiker/-in" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Modellbau" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Reise & Eventservices" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Trödel" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Verloren & Gefunden" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weiteres Freizeit, Hobby & Nachbarschaft" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Badezimmer" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Büro" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Heimtextilien" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Heimwerken" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Lampen & Licht" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weiteres Haus & Garten" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Nutztiere" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Tierbetreuung & Training" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Vögel" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Eigentumswohnungen" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Häuser zum Kauf" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Häuser zur Miete" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Mietwohnungen" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Umzug & Transport" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weitere Immobilien" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Ausbildung" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Kundenservice & Call Center" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Mini- & Nebenjobs" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Praktika" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weiteres Mode & Beauty" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Büro & Schreibwaren" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Comics" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Fachbücher, Schule & Studium" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Film & DVD" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Musik & CDs" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Musikinstrumente" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weitere Musik, Filme & Bücher" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Nachbarschaftshilfe" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Beauty & Gesundheit" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Computerkurse" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Esoterik & Spirituelles" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Kochen & Backen" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Kunst & Gestaltung" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Musik & Gesang" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Nachhilfe" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Sportkurse" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Sprachkurse" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Tanzkurse" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weiterbildung" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weitere Unterricht & Kurse" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Tauschen" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Verleihen" ] || [ \
				"$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Verschenken" ];
			then
				strg_f
        		xte "str ""$(echo "$CATEGORY" | head -n 2 | tail -n 1)"
				waitloaded_1
        		keyEscape
				keyReturn
				waitloaded_1
				strg_f
				xte "key BackSpace"
				waitloaded_1
				xte "str Weiter"
				waitloaded_1
				keyTab
				waitloaded_1
				keyReturn
				waitloaded_1
        		keyEscape
				keyTab
				waitloaded_1
				xte "keydown Shift_L" "key Tab" "keyup Shift_L"
				waitloaded_1
				keyReturn
			elif [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Küche & Esszimmer" ];
			then
				strg_f
        		xte "str ""$(echo "$CATEGORY" | head -n 2 | tail -n 1)"
				waitloaded_1
        		keyEscape
				keyReturn
				waitloaded_1
				strg_f
        		xte "str ""$(echo "$CATEGORY" | head -n 3 | tail -n 1)"
				waitloaded_1
        		keyEscape
				keyReturn
				waitloaded_1
				strg_f
				xte "key BackSpace"
				waitloaded_1
				xte "str Weiter"
				waitloaded_1
				xte "keydown Shift_L" "key Tab" "keyup Shift_L"
				waitloaded_1
				keyReturn
				waitloaded_1
        		keyEscape
				keyTab
				waitloaded_1
				xte "keydown Shift_L" "key Tab" "keyup Shift_L"
				waitloaded_1
				keyReturn
				echo "$CATEGORY"
				"$SHELL" -c "$LOG \"Küche & Esszimmer\""
				fail
			else
				fail
			fi
		else
			fail
		fi
 "$SHELL" -c "$LOG \"4. Shipping\""
		if [ "$(echo "$SHIPPING" | head -n 1)" == "Versand möglich" ]; then
			strg_f
			xte "str Versandmethoden"
			waitloaded_1
        	keyEscape
			keyTab
			keyReturn
			strg_f
			xte "str Andere Versandmethoden"
			waitloaded_1
        	keyEscape
			keyTab
			waitloaded_1
			xte "keydown Shift_L" "key Tab" "keyup Shift_L"
			keyReturn
			strg_f
			xte "str Andere Optionen"
			waitloaded_1
        	keyEscape
			keyTab
			keyReturn
			for i in $(seq 1 3); do
				keyTab
			done
			keyReturn
		else
			fail
		fi
 "$SHELL" -c "$LOG \"5. Price\""
		strg_f
		xte "str Preis"
		waitloaded_1
		keyEscape
		keyTab
		waitloaded_1
		xte "str ""$PRICE"
		waitloaded_1
		for i in $(seq 1 2); do
			keyTab
		done
		waitloaded_1
		xte "key Down"
		waitloaded_1
 "$SHELL" -c "$LOG \"6. Description\""
		strg_f
		xte "str Beschreibung"
		waitloaded_1
		keyEscape
		keyTab
		waitloaded_1
		for i in $(seq 1 $(echo "$DESCRIPTION" | wc -l)); do
			xte "str ""$(echo "$DESCRIPTION" | head -n $i | tail -n 1)"
			keyReturn
		done
 "$SHELL" -c "$LOG \"7. Pictures\""
		strg_f
		xte "str (empfohlen)"
		waitloaded_1
		keyEscape
		keyTab
		keyReturn
		xte "str ""$DOWNLOADS"
		for i in $(seq 1 2); do
			keyReturn
		done
		xte "keydown Control_L" "key A" "keyup Control_L"
    	keyReturn
 "$SHELL" -c "$LOG \"8. Insert\""
		strg_f
		xte "str unserer Datenschutzerklärung"
		waitloaded_1
		keyEscape
		for i in $(seq 1 2); do
			keyTab
		done
		keyReturn