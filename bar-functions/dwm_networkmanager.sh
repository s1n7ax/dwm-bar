#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP using NetworkManager
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

dwm_networkmanager () {
    CONNAME=$(iwgetid -r)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "🌐 %s" "$CONNAME"
    else
        printf "NET %s" "$CONNAME"
    fi
    printf "%s\n" "$SEP2"
}

dwm_networkmanager
