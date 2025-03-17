#!/bin/bash

. "$HOME""/automation/env.sh"

mail=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | head -n1)"`
password=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | tail -n1)"`

"$SHELL" -c "$LOG \"Start\""
	"$SHELL" "$HOME""/automation/utils_startpage.sh" "https://kleinanzeigen.de"
 	xte "keydown Control_L" "key F" "keyup Control_L"
    "$SHELL" -c "$WAITLOADED 1"
 	xte "str tippen sie zum Ablehnen bitte hier"
 	"$SHELL" -c "$WAITLOADED 1"
 	xte "key Escape"
	"$SHELL" -c "$WAITLOADED 1"
 	"$SHELL" -c "$KEY_RETURN";
	"$SHELL" "$HOME""/automation/firefox_status.sh"
	if [ $? -ne 0 ]; then
		"$SHELL" $0;
		exit 0;
	fi
 "$SHELL" -c "$LOG \"Enter Credentials\""
 	for i in $(seq 1 5); do
 		"$SHELL" -c "$KEY_TAB"
 	done;
 	"$SHELL" -c "$WAITLOADED 1"
 	"$SHELL" -c "$KEY_RETURN"
	"$SHELL" "$HOME""/automation/firefox_status.sh"
	if [ $? -ne 0 ]; then
		"$SHELL" $0;
		exit 0;
	fi
 	xte "$mail"
 	"$SHELL" -c "$WAITLOADED 1"
 	"$SHELL" -c "$KEY_TAB"
 	"$SHELL" -c "$WAITLOADED 1"
 	xte "$password"
 	"$SHELL" -c "$WAITLOADED 1"
 	for i in $(seq 1 2); do
 		"$SHELL" -c "$KEY_TAB"
 	done;
 	"$SHELL" -c "$WAITLOADED 1"
 	"$SHELL" -c "$KEY_RETURN";
	"$SHELL" "$HOME""/automation/firefox_status.sh";
	if [ $? -ne 0 ]; then
		"$SHELL" $0;
		exit 0;
	fi