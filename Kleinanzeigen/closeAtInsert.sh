#!/bin/bash

. "$HOME""/automation/env.sh"

sh "$HOME""/automation/firefox_private.sh" "www.google.com"

"$SHELL" -c "$WAITLOADED 2"

if [ -z "$(wmctrl -l | grep 'Google')" ]; then
    echo FAIL!
    exit 0
fi

rm -r /home/automate/.ssh/*
expect "$AUTOMATION""/closeDocker.sh" $(cat "$HOME""/credentials/ssh.txt" | head -n1) $(cat "$HOME""/credentials/ssh.txt" | tail -n1)