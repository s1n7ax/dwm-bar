#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Srinesh Nisala<srineshnisala@gmail.com>
# GNU GPLv3

dwm_resources () {

    # Used and total memory
    MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    MEMTOT=$(free -h |awk '(NR == 2) {print $2}')

    # CPU temperature mean
    CPU=$(sensors | grep '^Core.*' | awk '{ gensub(/\+(\\d)°C/, "\\1", "g", $3) } {s+=$3} END {print s/NR"%"}')

    # Used and total storage in / (rounded to 1024B)
    STOUSED=$(df -h | grep '/$' | awk '{print $3}')
    STOTOT=$(df -h | grep '/$' | awk '{print $2}')
    STOPER=$(df -h | grep '/$' | awk '{print $5}')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "💻 MEM %s/%s CPU %s STO %s/%s: %s" "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER"
    else
        printf "STA | MEM %s/%s CPU %s STO %s/%s: %s" "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER"
    fi
    printf "%s\n" "$SEP2"
}

dwm_resources
