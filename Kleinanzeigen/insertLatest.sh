#!/bin/sh

. "$HOME""/automation/env.sh"

function keyReturn {
	sh -c "$KEY_RETURN"; sh "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
}

function keyTab {
	sh -c "$KEY_TAB"
}

function waitloaded_1 {
	sh -c "$WAITLOADED 1"
}


mail=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | head -n1)"`
password=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | tail -n1)"`

sh -c "$LOG \"Start\""
	sh "$HOME""/automation/utils_startpage.sh" "https://kleinanzeigen.de"

sh -c "$LOG \"Enter Credentials\""
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
sh -c "$LOG \"\""
sh -c "$LOG \"Get to last Item\""
sh -c "$LOG \"1. Search 'kleinanzeigen'\""
	xte "keydown Control_L" "key F" "keyup Control_L"
	waitloaded_1
	xte "str Kleinanzeigen"
	waitloaded_1
sh -c "$LOG \"   Escape Dialog\""
	xte "key Escape"
	waitloaded_1
sh -c "$LOG \"   Reverse Tab x2\""
	for i in $(seq 1 2); do
	        xte "keydown Shift_L" "key Tab" "keyup Shift_L"
	done;
	waitloaded_1
sh -c "$LOG \"   Hit Return\""
	keyReturn
	waitloaded_1
sh -c "$LOG \"2. Search 'Endet'\""
	xte "keydown Control_L" "key F" "keyup Control_L"
	waitloaded_1
	xte "key BackSpace"
	waitloaded_1
	xte "str Endet"
	waitloaded_1
sh -c "$LOG \"   Tab\""
	keyTab
	waitloaded_1
sh -c "$LOG \"   Hit Return\""
	keyReturn
sh -c "$LOG \"   Escape Dialog\""
	xte "key Escape"
	waitloaded_1
sh -c "$LOG \"   Reverse Tab\""
	xte "keydown Shift_L" "key Tab" "keyup Shift_L"
	waitloaded_1
sh -c "$LOG \"   Hit Return\""
	keyReturn
sh -c "$LOG \"3. Save Item Page\""
	WEBPAGE="$(sh "$HOME""/automation/utils_saveWebsite.sh")"
sh -c "$LOG \"Analyze Webpage\""
sh -c "$LOG \"1. Pictures\""
	PICTURES=$(cat "$WEBPAGE" | sed 's/ /\n/g' | grep "data-imgsrc=" | sed 's/"/\n/g' | grep "http" | grep "_57.AUTO")
	cat $PICTURES
	digit=0;
	for i in $PICTURES; do
		echo $i
		output=$(printf "%02d.jpg" $digit)
		wget $i -O "$DOWNLOADS""/""$output"
		digit=$(($digit+1))
	done
sh -c "$LOG \"2. Title\""
        TITLE="$(cat "$WEBPAGE" | grep 'itemName: "' | sed 's/itemName: "/\n/g' | grep ',$' | sed 's/",//g')"
sh -c "$LOG \"3. Price\""
        PRICE="$(cat "$WEBPAGE" | grep '€</h2>' | sed 's/ //g;s/€<\/h2>//g')"
sh -c "$LOG \"4. Shipping\""
        SHIPPING="$(cat "$WEBPAGE" | grep boxedarticle--details--shipping | sed 's/> /\n/g;s/<\/span>//g' | grep -v boxedarticle--details--shipping)"
sh -c "$LOG \"5. Description\""
        DESCRIPTION="$(cat "$WEBPAGE" | grep -A1 'itemprop="description">' | grep -v 'itemprop="description">' | xargs | sed 's/<\/p>//g;s/<br>/\n/g')"
sh -c "$LOG \"6. Category\""
        CATEGORY="$(cat "$WEBPAGE" | grep breadcrump-link | sed 's/title">/\n/g;s/<\/span><\/a>//g' | grep -v '<a class')"

sh -c "$LOG \"Insert item\""
sh -c "$LOG \"1. Open \"Anzeige Aufgeben\"\""
        xte "keydown Control_L" "key F" "keyup Control_L"
        waitloaded_1
        xte "str Inserieren"
        waitloaded_1
        xte "key Escape"
        waitloaded_1
		keyReturn
sh -c "$LOG \"2. Enter Title\""
        xte "keydown Control_L" "key F" "keyup Control_L"
        waitloaded_1
        xte "str Titel"
        waitloaded_1
        xte "key Escape"
        waitloaded_1
        keyTab
        waitloaded_1
        xte "str ""$TITLE"
		waitloaded_1
sh -c "$LOG \"3. Category\""
		if [ "$(echo "$CATEGORY" | head -n 1)" -eq "Elektronik" ]; then
			keyTab
			waitloaded_1
			keyReturn
			waitloaded_1
		else
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
		fi




