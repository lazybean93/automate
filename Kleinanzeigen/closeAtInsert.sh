#!/bin/bash

. "$HOME""/automation/env.sh"


"$SHELL" -c "$WAITLOADED 2"

if [ -n "$(wmctrl -l | grep 'Deine Anzeige geht bald online')" ]; then
    echo true
else
    echo false
fi