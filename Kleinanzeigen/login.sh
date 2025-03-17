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