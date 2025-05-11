#!/bin/bash

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
        "$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$LOG \"2. Enter Title\""
        "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
        xte "str Titel"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
        "$SHELL" -c "$KEY_TAB"
        "$SHELL" -c "$WAITLOADED 1"
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
            "$SHELL" -c "$KEY_SEARCH";
            "$SHELL" -c "$WAITLOADED 1"
            xte "str Kategorie"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Tab"
            "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_RETURN"
            "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_SEARCH"
            "$SHELL" -c "$WAITLOADED 1"
            xte "str ""$(echo "$CATEGORY" | head -n 1)"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"; "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_RETURN"
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
                "$SHELL" -c "$KEY_SEARCH"
                "$SHELL" -c "$WAITLOADED 1"
                xte "str ""$(echo "$CATEGORY" | head -n 2 | tail -n 1)"
                "$SHELL" -c "$WAITLOADED 1"
                exit 0
                xte "key Escape"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_SEARCH"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key BackSpace"
                "$SHELL" -c "$WAITLOADED 1"
                xte "str Kleinanzeigen"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key Escape"
                "$SHELL" -c "$WAITLOADED 1"
                xte "keydown Shift_L" "key Tab" "keyup Shift_L"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"
            elif [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Autoteile & Reifen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Boote & Bootszubehör" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Fahrräder & Zubehör" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Motorräder & Motorroller" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Motorradteile & Zubehör" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Nutzfahrzeuge & Anhänger" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Reparaturen & Dienstleistungen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Wohnwagen & -mobile" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Haus & Garten" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Audio & Hifi" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Foto" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Handy & Telefon" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Haushaltsgeräte" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Konsolen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "PC-Zubehör & Software" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Tablets & Reader" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "TV & Video" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Videospiele" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Baby- & Kinderkleidung" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Baby- & Kinderschuhe" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Kinderzimmermöbel" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Spielzeug" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Sammeln" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Sport & Camping" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Dekoration" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Dienstleistungen Haus & Garten" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Gartenzubehör & Pflanzen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Küche & Esszimmer" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Schlafzimmer" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Wohnzimmer" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Fische" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Hunde" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Katzen" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Kleintiere" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Pferde" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Vermisste Tiere" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Zubehör" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Auf Zeit & WG" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Container" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Ferien- & Auslandsimmobilien" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Garagen & Stellplätze" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Gewerbeimmobilien" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Grundstücke & Gärten" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Bau, Handwerk & Produktion" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Büroarbeit & Verwaltung" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Gastronomie & Tourismus" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Sozialer Sektor & Pflege" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Transport, Logistik & Verkehr" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Vertrieb, Einkauf & Verkauf" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Weitere Jobs" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Beauty & Gesundheit" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Damenbekleidung" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Damenschuhe" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Herrenbekleidung" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Herrenschuhe" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Taschen & Accessoires" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Uhren & Schmuck" ] || \
                [ "$(echo "$CATEGORY" | head -n 2 | tail -n 1)" == "Bücher & Zeitschriften" ];
            then
                "$SHELL" -c "$KEY_SEARCH"
                "$SHELL" -c "$WAITLOADED 1"
                xte "str ""$(echo "$CATEGORY" | head -n 2 | tail -n 1)"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key Escape"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_SEARCH"
                "$SHELL" -c "$WAITLOADED 1"
                xte "str ""$(echo "$CATEGORY" | head -n 3 | tail -n 1)"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key Escape"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_SEARCH"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key BackSpace"
                "$SHELL" -c "$WAITLOADED 1"
                xte "str Kleinanzeigen"
                "$SHELL" -c "$WAITLOADED 1"
                xte "key Escape"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$WAITLOADED 1"
                xte "keydown Shift_L" "key Tab" "keyup Shift_L"
                "$SHELL" -c "$WAITLOADED 1"
                "$SHELL" -c "$KEY_RETURN"
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
                cat $RESULT
                exit 0
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
        if [ "$(echo "$SHIPPING" | head -n 1)" == "Versand möglich" ] || [ \
            "$(echo "$SHIPPING" | head -n 1)" == "+ Versand ab 4,89 €" \
        ]; then
            "$SHELL" -c "$KEY_SEARCH"
            "$SHELL" -c "$WAITLOADED 1"
            xte "str Versandmethoden"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"
            "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_TAB"
            "$SHELL" -c "$KEY_RETURN"
            "$SHELL" -c "$KEY_SEARCH"
            "$SHELL" -c "$WAITLOADED 1"
            xte "str Andere Versandmethoden"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"
            "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_TAB"
            "$SHELL" -c "$WAITLOADED 1"
            xte "keydown Shift_L" "key Tab" "keyup Shift_L"
            "$SHELL" -c "$KEY_RETURN"
            "$SHELL" -c "$KEY_SEARCH"
            "$SHELL" -c "$WAITLOADED 1"
            xte "str Andere Optionen"
            "$SHELL" -c "$WAITLOADED 1"
            xte "key Escape"
            "$SHELL" -c "$WAITLOADED 1"
            "$SHELL" -c "$KEY_TAB"
            "$SHELL" -c "$WAITLOADED 1"
            xte "str  "
            for i in $(seq 1 3); do
                "$SHELL" -c "$KEY_TAB"
            done
            "$SHELL" -c "$KEY_RETURN";
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
            cat $RESULT
            exit 0
        fi
"$SHELL" -c "$LOG \"5. Price\""
        "$SHELL" -c "$KEY_SEARCH"
        "$SHELL" -c "$WAITLOADED 1"
        xte "str Preis"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"
        "$SHELL" -c "$WAITLOADED 1"
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
        "$SHELL" -c "$KEY_SEARCH"
        "$SHELL" -c "$WAITLOADED 1"
        xte "str Beschreibung"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"
        "$SHELL" -c "$WAITLOADED 1"
        "$SHELL" -c "$KEY_TAB"
        "$SHELL" -c "$WAITLOADED 1"
        for i in $(seq 1 $(echo "$DESCRIPTION" | wc -l)); do
            xte "str ""$(echo "$DESCRIPTION" | head -n $i | tail -n 1)"
            "$SHELL" -c "$KEY_RETURN"
        done
"$SHELL" -c "$LOG \"7. Pictures\""
        "$SHELL" -c "$KEY_SEARCH"
        "$SHELL" -c "$WAITLOADED 1"
        xte "str (empfohlen)"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"
        "$SHELL" -c "$WAITLOADED 1"
        "$SHELL" -c "$KEY_TAB"
        "$SHELL" -c "$KEY_RETURN"
        xte "str ""$DOWNLOADS"
        for i in $(seq 1 2); do
            "$SHELL" -c "$KEY_RETURN"
        done
        xte "keydown Control_L" "key A" "keyup Control_L"
        "$SHELL" -c "$KEY_RETURN"
"$SHELL" -c "$LOG \"8. Insert\""
        "$SHELL" -c "$KEY_SEARCH"; "$SHELL" -c "$WAITLOADED 1"
        xte "str Daten findest du in unserer Datenschutzerklärung"
        "$SHELL" -c "$WAITLOADED 1"
        xte "key Escape"
        "$SHELL" -c "$WAITLOADED 1"
        for i in $(seq 1 3); do
            "$SHELL" -c "$KEY_TAB"
        done
        "$SHELL" -c "$KEY_RETURN"