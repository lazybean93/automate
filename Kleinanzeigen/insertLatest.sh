. "$HOME""/automation/env.sh"

mail=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | head -n1)"`
password=`echo str "$(cat "$HOME""/Kleinanzeigen/credentials.txt" | tail -n1)"`

sh -c "$LOG \"Start\""
	sh "$HOME""/automation/utils_startpage.sh" "https://kleinanzeigen.de"
sh -c "$LOG \"Enter Credentials\""
	for i in $(seq 1 5); do
		xte 'key Tab'
	done;
	sh -c "$WAITLOADED 1"
	sh -c "$KEY_RETURN"; sh "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; fi
	xte "$mail"
	sh -c "$WAITLOADED 1"
	xte 'key Tab'
	sh -c "$WAITLOADED 1"
	xte "$password"
	sh -c "$WAITLOADED 1"
	for i in $(seq 1 2); do
		xte 'key Tab'
	done;
	sh -c "$WAITLOADED 1"
	sh -c "$KEY_RETURN"; sh "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; fi
sh -c "$LOG \"\""
sh -c "$LOG \"Get to last Item\""
sh -c "$LOG \"1. Search 'kleinanzeigen'\""
	xte "keydown Control_L" "key F" "keyup Control_L"
	sh -c "$WAITLOADED 1"
	xte "str Kleinanzeigen"
	sh -c "$WAITLOADED 1"
sh -c "$LOG \"   Escape Dialog\""
	xte "key Escape"
	sh -c "$WAITLOADED 1"
sh -c "$LOG \"   Reverse Tab x2\""
	for i in $(seq 1 2); do
	        xte "keydown Shift_L" "key Tab" "keyup Shift_L"
	done;
	sh -c "$WAITLOADED 1"
sh -c "$LOG \"   Hit Return\""
	sh -c "$KEY_RETURN"; sh "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; fi
sh -c "$LOG \"2. Search 'Endet'\""
	xte "keydown Control_L" "key F" "keyup Control_L"
	sh -c "$WAITLOADED 1"
	xte "key BackSpace"
	sh -c "$WAITLOADED 1"
	xte "str Endet"
	sh -c "$WAITLOADED 1"
sh -c "$LOG \"   Tab\""
	xte "key Tab"
	sh -c "$WAITLOADED 1"
sh -c "$LOG \"   Hit Return\""
	sh -c "$KEY_RETURN"; sh "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; fi
sh -c "$LOG \"   Escape Dialog\""
	xte "key Escape"
	sh -c "$WAITLOADED 1"
sh -c "$LOG \"   Reverse Tab\""
	xte "keydown Shift_L" "key Tab" "keyup Shift_L"
	sh -c "$WAITLOADED 1"
sh -c "$LOG \"   Hit Return\""
	sh -c "$KEY_RETURN"; sh "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; fi
sh -c "$LOG \"3. Save Item Page\""
	WEBPAGE="$(sh "$HOME""/automation/utils_saveWebsite.sh")"
#	WEBPAGE="$HOME""/Downloads/Touchpad incl. Kabel aus Asus Z53J in Vahr - Neue Vahr Nord kleinanzeigen.de.html"
sh -c "$LOG \"Analyze Webpage\""
sh -c "$LOG \"1. Pictures\""
	PICTURES=$(cat "$WEBPAGE" | sed 's/ /\n/g' | grep "data-imgsrc=" | sed 's/"/\n/g' | grep "http" | grep "_57.AUTO")
	digit=0;
	for i in $PICTURES; do
		echo $i
		output=$(printf "%02d.avif" $digit)
		wget $i -O $output
		digit=$(($digit+1))
	done
sh -c "$LOG \"2. Title\""
sh -c "$LOG \"3. Price\""
sh -c "$LOG \"4. Shipping\""
sh -c "$LOG \"5. Description\""
