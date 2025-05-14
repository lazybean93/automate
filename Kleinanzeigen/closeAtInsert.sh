#!/bin/bash

. "$HOME""/automation/env.sh"


"$SHELL" -c "$WAITLOADED 2"

wmctrl -l | grep 'Deine Anzeige geht bald online'