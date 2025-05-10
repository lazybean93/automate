#!/bin/bash

. "$HOME""/automation/env.sh"

mail=`echo str "$(cat "$HOME""/credentials/kleinanzeigen.txt" | head -n1)"`
password=`echo str "$(cat "$HOME""/credentials/kleinanzeigen.txt" | tail -n1)"`

"$SHELL" -c "$LOG \"Start\""
    "$SHELL" "$HOME""/automation/utils_startpage_dirty.sh" "https://kleinanzeigen.de"
    "$SHELL" -c "$KEY_SEARCH"
    "$SHELL" -c "$WAITLOADED 1"
    xte "str Impressum"
    "$SHELL" -c "$WAITLOADED 1"
    "$SHELL" -c "$KEY_ESCAPE"
    "$SHELL" -c "$WAITLOADED 1"
    for i in $(seq 1 3); do
        "$SHELL" -c "$LOG \"Tab Reverse\""
        xte "keydown Shift_L" "key Tab" "keyup Shift_L"
    done
    "$SHELL" -c "$WAITLOADED 1"
    "$SHELL" -c "$KEY_RETURN"
    for i in $(seq 1 5); do
        "$SHELL" -c "$LOG \"xte key Tab\""
        xte "key Tab"
    done
    "$SHELL" -c "$WAITLOADED 1"
    exit 0
    "$SHELL" -c "$KEY_RETURN"

"$SHELL" -c "$LOG \"Enter Credentials\""
    "$SHELL" -c "$WAITLOADED 1"
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
    "$SHELL" -c "$KEY_RETURN"