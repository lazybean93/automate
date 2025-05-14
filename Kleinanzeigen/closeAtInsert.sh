#!/bin/bash

. "$HOME""/automation/env.sh"


"$SHELL" -c "$WAITLOADED 2"

if [ -z "$(wmctrl -l | grep 'Deine Anzeige geht bald online')" ]; then
    echo FAIL!
    exit 0
fi

rm -r /home/automate/.ssh/*
expect "$AUTOMATION""/closeDocker.sh" $PASSWORD_SSH