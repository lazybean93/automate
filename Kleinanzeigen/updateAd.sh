#!/bin/sh

. "$HOME""/automation/env.sh"

"$SHELL" -c "$LOG \"Kill Browser\""
    "$SHELL" -c "$CLEAN_DIRTY"

"$SHELL" -c "$LOG \"check if webage exists\""
if [ -z "$(ls Downloads | grep 00.jpg)" ]; then
    # true
    "$SHELL" -c "$HOME""/Kleinanzeigen/exportLatest.sh"
else
    # false
    "$SHELL" -c "$HOME""/Kleinanzeigen/login.sh"
fi

CATEGORY="$(cat "$DOWNLOADS"/CATEGORY)"
DESCRIPTION="$(cat "$DOWNLOADS"/DESCRIPTION)"
PICTURES="$(cat "$DOWNLOADS"/PICTURES)"
PRICE="$(cat "$DOWNLOADS"/PRICE)"
SHIPPING="$(cat "$DOWNLOADS"/SHIPPING)"
TITLE="$(cat "$DOWNLOADS"/TITLE)"

echo ------
echo "$CATEGORY"
echo ------
echo "$DESCRIPTION"
echo ------
echo "$PICTURES"
echo ------
echo "$PRICE"
echo ------
echo "$SHIPPING"
echo ------
echo "$TITLE"
echo ------

"$SHELL" -c "$LOG \"Insert item\""
"$SHELL" -c "$LOG \"1. Open \"Anzeige Aufgeben\"\""
        "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
        xte "str Inserieren"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
        "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
"$SHELL" -c "$LOG \"2. Enter Title\""
        "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
        xte "str Titel"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
        "$SHELL" -c "$KEY_TAB"
        "$SHELL" -c "$WAITLOADED 1"
        xte "str ""$TITLE"
"$SHELL" -c "$LOG \"3. Category\""
        echo $(echo "$CATEGORY" | head -n 1) I
        if [ "$(echo "$CATEGORY" | head -n 1)" -eq "Auto, Rad & Boot"  ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Dienstleistungen" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Eintrittskarten & Tickets"  ] || [  \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Elektronik" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Familie, Kind & Baby" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Freizeit, Hobby & Nachbarschaft" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Haus & Garten" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Haustiere" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Immobilien" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Jobs" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Mode & Beauty" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Musik, Filme & Bücher" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Nachbarschaftshilfe" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Unterricht & Kurse" ] || [ \
            "$(echo "$CATEGORY" | head -n 1)" -eq "Verschenken & Tauschen" ];
        then
            "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
            xte "str Wähle deine Kategorie"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
            "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
            xte "str ""$(echo "$CATEGORY" | head -n 1)"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
            if [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Reparaturen & Dienstleistungen" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weiteres Auto, Rad & Boot" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Altenpflege" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Auto, Rad & Boot" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Babysitter/-in & Kinderbetreuung" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Elektronik" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Haus & Garten" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Reise & Event" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Tierbetreuung & Training" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Umzug & Transport" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weitere Dienstleistungen" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Bahn & ÖPNV" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Comedy & Kabarett" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Gutscheine" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Kinder" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Konzerte" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Sport" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Theater & Musical" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weitere Eintrittskarten & Tickets" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Dienstleistungen Elektronik" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Notebooks" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "PCs" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weitere Elektronik" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Altenpflege" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Baby-Ausstattung" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Babyschalen & Kindersitze" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Babysitter/-in & Kinderbetreuung" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Kinderwagen & Buggys" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weiteres Familie, Kind & Baby" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Esoterik & Spirituelles" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Essen & Trinken" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Freizeitaktivitäten" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Handarbeit, Basteln & Kunsthandwerk" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Kunst & Antiquitäten" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Künstler/-in & Musiker/-in" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Modellbau" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Reise & Eventservices" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Trödel" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Verloren & Gefunden" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weiteres Freizeit, Hobby & Nachbarschaft" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Badezimmer" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Büro" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Heimtextilien" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Heimwerken" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Lampen & Licht" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weiteres Haus & Garten" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Nutztiere" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Tierbetreuung & Training" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Vögel" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Eigentumswohnungen" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Häuser zum Kauf" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Häuser zur Miete" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Mietwohnungen" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Umzug & Transport" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weitere Immobilien" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Ausbildung" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Kundenservice & Call Center" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Mini- & Nebenjobs" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Praktika" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weiteres Mode & Beauty" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Büro & Schreibwaren" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Comics" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Fachbücher, Schule & Studium" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Film & DVD" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Musik & CDs" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Musikinstrumente" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weitere Musik, Filme & Bücher" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Nachbarschaftshilfe" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Beauty & Gesundheit" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Computerkurse" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Esoterik & Spirituelles" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Kochen & Backen" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Kunst & Gestaltung" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Musik & Gesang" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Nachhilfe" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Sportkurse" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Sprachkurse" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Tanzkurse" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weiterbildung" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weitere Unterricht & Kurse" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Tauschen" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Verleihen" ] || [ \
                "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Verschenken" ];
            then
                "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
                xte "str ""$(echo "$CATEGORY" | head -n 2 | tail -n 1)"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
                xte "key BackSpace"
                "$SHELL" -c "$WAITLOADED 1"
                xte "str Kleinanzeigen"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$WAITLOADED 1"
                xte "keydown Shift_L" "key Tab" "keyup Shift_L"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
            elif [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Autoteile & Reifen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Boote & Bootszubehör" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Fahrräder & Zubehör" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Motorräder & Motorroller" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Motorradteile & Zubehör" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Nutzfahrzeuge & Anhänger" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Reparaturen & Dienstleistungen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Wohnwagen & -mobile" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Haus & Garten" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Audio & Hifi" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Foto" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Handy & Telefon" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Haushaltsgeräte" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Konsolen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "PC-Zubehör & Software" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Tablets & Reader" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "TV & Video" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Videospiele" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Baby- & Kinderkleidung" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Baby- & Kinderschuhe" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Kinderzimmermöbel" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Spielzeug" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Sammeln" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Sport & Camping" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Dekoration" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Dienstleistungen Haus & Garten" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Gartenzubehör & Pflanzen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Küche & Esszimmer" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Schlafzimmer" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Wohnzimmer" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Fische" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Hunde" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Katzen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Kleintiere" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Pferde" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Vermisste Tiere" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Zubehör" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Auf Zeit & WG" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Container" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Ferien- & Auslandsimmobilien" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Garagen & Stellplätze" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Gewerbeimmobilien" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Grundstücke & Gärten" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Bau, Handwerk & Produktion" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Büroarbeit & Verwaltung" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Gastronomie & Tourismus" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Sozialer Sektor & Pflege" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Transport, Logistik & Verkehr" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Vertrieb, Einkauf & Verkauf" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Weitere Jobs" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Beauty & Gesundheit" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Damenbekleidung" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Damenschuhe" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Herrenbekleidung" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Herrenschuhe" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Taschen & Accessoires" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Uhren & Schmuck" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" -eq "Bücher & Zeitschriften" ];
            then
                "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
                xte "str ""$(echo "$CATEGORY" | head -n 2 | tail -n 1)"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
                xte "str ""$(echo "$CATEGORY" | head -n 3 | tail -n 1)"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
                xte "key BackSpace"
                "$SHELL" -c "$WAITLOADED 1"
                xte "str Kleinanzeigen"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$WAITLOADED 1"
                xte "keydown Shift_L" "key Tab" "keyup Shift_L"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
            else
                RESULT="$DOWNLOADS""/res_""$(date +%s)"".log"; echo "$TITLE" >> $RESULT; echo "" >> $RESULT; echo "$PRICE" >> $RESULT; echo "" >> $RESULT; echo "$SHIPPING" >> $RESULT; echo "" >> $RESULT; echo "$DESCRIPTION" >> $RESULT; echo "" >> $RESULT; echo "$CATEGORY" >> $RESULT; sleep infinity
            fi
        else
            RESULT="$DOWNLOADS""/res_""$(date +%s)"".log";
            echo "$TITLE" >> $RESULT;
            echo "" >> $RESULT;
            echo "$PRICE" >> $RESULT;
            echo "" >> $RESULT
            echo "$SHIPPING" >> $RESULT;
            echo "" >> $RESULT
            echo "$DESCRIPTION" >> $RESULT;
            echo "" >> $RESULT
            echo "$CATEGORY" >> $RESULT
            exit
        fi
"$SHELL" -c "$LOG \"4. Shipping\""
        if [ "$(echo "$SHIPPING" | head -n 1)" -eq "Versand möglich" ]; then
            "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
            xte "str Versandmethoden"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_TAB"
            "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
            "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
            xte "str Andere Versandmethoden"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_TAB"
            "$SHELL" -c "$WAITLOADED 1"
            xte "keydown Shift_L" "key Tab" "keyup Shift_L"
            "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
            "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
            xte "str Andere Optionen"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_TAB"
            "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
            for i in $(seq 1 3); do
                "$SHELL" -c "$KEY_TAB"
            done
            "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
        else
            RESULT="$DOWNLOADS""/res_""$(date +%s)"".log"; echo "$TITLE" >> $RESULT; echo "" >> $RESULT; echo "$PRICE" >> $RESULT; echo "" >> $RESULT; echo "$SHIPPING" >> $RESULT; echo "" >> $RESULT; echo "$DESCRIPTION" >> $RESULT; echo "" >> $RESULT; echo "$CATEGORY" >> $RESULT; sleep infinity
        fi
"$SHELL" -c "$LOG \"5. Price\""
        "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
        xte "str Preis"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
        "$SHELL" -c "$KEY_TAB"
        "$SHELL" -c "$WAITLOADED 1"
        xte "str ""$PRICE"
        "$SHELL" -c "$WAITLOADED 1"
        for i in $(seq 1 2); do
            "$SHELL" -c "$KEY_TAB"
        done
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Down"
        "$SHELL" -c "$WAITLOADED 1"
"$SHELL" -c "$LOG \"6. Description\""
        "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
        xte "str Beschreibung"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
        "$SHELL" -c "$KEY_TAB"
        "$SHELL" -c "$WAITLOADED 1"
        for i in $(seq 1 $(echo "$DESCRIPTION" | wc -l)); do
            xte "str ""$(echo "$DESCRIPTION" | head -n $i | tail -n 1)"
            "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
        done
"$SHELL" -c "$LOG \"7. Pictures\""
        "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
        xte "str (empfohlen)"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
        "$SHELL" -c "$KEY_TAB"
        "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
        xte "str ""$DOWNLOADS"
        for i in $(seq 1 2); do
            "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
        done
        xte "keydown Control_L" "key A" "keyup Control_L"
        "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi
exit
"$SHELL" -c "$LOG \"8. Insert\""
        "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
        xte "str Daten findest du in unserer Datenschutzerklärung"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
        for i in $(seq 1 2); do
            "$SHELL" -c "$KEY_TAB"
        done
        "$SHELL" -c "$KEY_RETURN"; "$SHELL" "$HOME""/automation/firefox_status.sh"; if [ $? -ne 0 ]; then sh $0; exit 0; fi