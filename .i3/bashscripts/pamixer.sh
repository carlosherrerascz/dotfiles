#!/bin/bash
#while i3 is running...
MUTE=$(pamixer --get-mute)
if [[ $MUTE == false ]]; then
    VOLUME=$(pamixer --get-volume)
    if [ $VOLUME > 45 ]; then
        ICON=" $VOLUME"

    else
        ICON=" $VOLUME "
    fi
else
    ICON=""
fi
echo $ICON
