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
}

mail=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | head -n1)"`
password=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | tail -n1)"`

"$SHELL" -c "$LOG \"Start\""
	"$SHELL" "$HOME""/automation/utils_startpage_dirty.sh" "https://kleinanzeigen.de"
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
	WEBPAGE=$(ls -t /home/automate/Downloads/*kleinanzeigen.de.html | head -n 1)

	
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
        TITLE="$(cat "$WEBPAGE" | grep 'itemName: "' | sed 's/itemName: "/\n/g' | grep ',$' | sed 's/",//g')"
  "$SHELL" -c "$LOG \"3. Price\""
        PRICE="$(cat "$WEBPAGE" | grep '€</h2>' | sed 's/ //g;s/€<\/h2>//g')"
  "$SHELL" -c "$LOG \"4. Shipping\""
        SHIPPING="$(cat "$WEBPAGE" | grep boxedarticle--details--shipping | sed 's/> /\n/g;s/<\/span>//g' | grep -v boxedarticle--details--shipping)"
  "$SHELL" -c "$LOG \"5. Description\""
        DESCRIPTION="$(cat "$WEBPAGE" | grep -A1 'itemprop="description">' | grep -v 'itemprop="description">' | xargs | sed 's/<\/p>//g;s/<br>/\n/g')"
  "$SHELL" -c "$LOG \"6. Category\""
        CATEGORY="$(cat "$WEBPAGE" | grep breadcrump-link | sed 's/title">/\n/g;s/<\/span><\/a>//g' | grep -v '<a class')"

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
		if [ "$(echo "$CATEGORY" | head -n 1)" == "Elektronik" ]; then
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
			if [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Notebooks" ]; then
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

		