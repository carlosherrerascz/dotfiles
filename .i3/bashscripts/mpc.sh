#!/bin/bash
NOWPLAYING=$(mpc current)
if [ $NOWPLAYING=" " ]; then
    :
else
    echo " "$NOWPLAYING /
fi

