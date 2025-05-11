#!/bin/bash

. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Clean\""
    "$SHELL" -c "$CLEAN"

"$SHELL" -c "$LOG \"Login\""
    "$SHELL" -c "$HOME""/Kleinanzeigen/login.sh"

"$SHELL" -c "$LOG \"Get to last Item\""
    "$SHELL" -c "$KEY_SEARCH"
    "$SHELL" -c "$WAITLOADED 1"
    xte "str Kleinanzeigen"
    "$SHELL" -c "$WAITLOADED 1"
    xte "key Escape"
    "$SHELL" -c "$WAITLOADED 1"
    for i in $(seq 1 2); do
        xte "keydown Shift_L" "key Tab" "keyup Shift_L"
    done;
    "$SHELL" -c "$WAITLOADED 1"
    "$SHELL" -c "$KEY_RETURN"
    "$SHELL" -c "$WAITLOADED 1"
    "$SHELL" -c "$KEY_SEARCH"
    "$SHELL" -c "$WAITLOADED 1"
    xte "str Endet"
    "$SHELL" -c "$WAITLOADED 1"
    "$SHELL" -c "$KEY_TAB"
    "$SHELL" -c "$WAITLOADED 1"
    "$SHELL" -c "$KEY_RETURN"
    xte "key Escape"
    "$SHELL" -c "$WAITLOADED 1"
    xte "keydown Shift_L" "key Tab" "keyup Shift_L"
    "$SHELL" -c "$WAITLOADED 1"
    "$SHELL" -c "$KEY_RETURN"

"$SHELL" -c "$LOG \"3. Save Item Page\""
    WEBPAGE="$("$SHELL" "$HOME""/automation/utils_saveWebsite.sh")"
    cp -r "$WEBPAGE" ~/

"$SHELL" -c "$LOG \"Analyze Webpage\""
  "$SHELL" -c "$LOG \"1. Pictures\""
    PICTURES=$(cat "$WEBPAGE" | sed 's/ /\n/g' | grep "data-imgsrc=" | sed 's/"/\n/g' | grep "http" | grep "_57.AUTO")
    digit=0;
    for i in $PICTURES; do
        echo $i
        echo $i >> "$DOWNLOADS""/PICTURES"
        output=$(printf "%02d.jpg" $digit)
        wget $i -O "$DOWNLOADS""/""$output"  > /dev/zero 2>&1
        digit=$(($digit+1))
    done
  "$SHELL" -c "$LOG \"2. Title\""
#        TITLE="$(cat "$WEBPAGE" | grep 'itemName: "' | sed 's/itemName: "/\n/g' | grep ',$' | sed 's/",//g' | sed 's/\&amp;/\&/g')"
        TITLE="$(cat "$WEBPAGE" | sed 's/>/>\n/g' | grep 'content' | grep 'og:title' | sed 's/content="/\n/g;s/">//g' | tail -n1)"
        echo "$TITLE"
        echo "$TITLE" > "$DOWNLOADS""/TITLE"
  "$SHELL" -c "$LOG \"3. Price\""
        PRICE="$(cat "$WEBPAGE" | grep '€</h2>' | sed 's/ //g;s/€<\/h2>//g')"
        echo "$PRICE"
        echo "$PRICE" > "$DOWNLOADS""/PRICE"
  "$SHELL" -c "$LOG \"4. Shipping\""
        SHIPPING="$(cat "$WEBPAGE" | grep boxedarticle--details--shipping | sed 's/> /\n/g;s/<\/span>//g' | grep -v boxedarticle--details--shipping | sed 's/\&amp;/\&/g')"
        echo "$SHIPPING"
        echo "$SHIPPING" > "$DOWNLOADS""/SHIPPING"
  "$SHELL" -c "$LOG \"5. Description\""
        DESCRIPTION="$(cat "$WEBPAGE" | grep -A1 'itemprop="description">' | grep -v 'itemprop="description">' | xargs | sed 's/<\/p>//g;s/<br>/\n/g' | sed 's/\&amp;/\&/g')"
        echo "$DESCRIPTION"
        echo "$DESCRIPTION" > "$DOWNLOADS""/DESCRIPTION"
  "$SHELL" -c "$LOG \"6. Category\""
        CATEGORY="$(cat "$WEBPAGE" | grep breadcrump-link | sed 's/title">/\n/g;s/<\/span><\/a>//g' | grep -v '<a class' | sed 's/\&amp;/\&/g'; cat "$WEBPAGE" | grep -C1 'Art<span' | tail -n1 | sed 's/    //g;s/<\/span>//g;s/\&amp;/\&/g')"
        echo "$CATEGORY"
        echo "$CATEGORY" > "$DOWNLOADS""/CATEGORY"

"$SHELL" -c "$LOG \"4. Remove Item\""
     "$SHELL" -c "$WAITLOADED 1"
     "$SHELL" -c "$KEY_SEARCH"
     "$SHELL" -c "$WAITLOADED 1"
     xte "str Löschen"
     "$SHELL" -c "$WAITLOADED 1"
     xte "key Escape"
     "$SHELL" -c "$WAITLOADED 1"
     "$SHELL" -c "$KEY_RETURN"
     "$SHELL" -c "$KEY_SEARCH"
     "$SHELL" -c "$WAITLOADED 1"
     xte "str Ja, Anzeige löschen"
     "$SHELL" -c "$WAITLOADED 1"
     xte "key Escape"
     "$SHELL" -c "$WAITLOADED 1"
     for i in $(seq 1 2); do
         "$SHELL" -c "$KEY_TAB"
     done
     sleep 2
     xte 'key Return'
     sleep 2
     "$SHELL" -c "$KEY_SEARCH"
     sleep 2
     xte "str Schließen"
     sleep 2
     xte "key Escape"
     for i in $(seq 1 2); do
         "$SHELL" -c "$KEY_TAB"
     done
     sleep 2;
     xte 'key Return';
     sleep 2;