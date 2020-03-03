#!/bin/bash
debut="2020-02-04 17:26"
t=$(date -d "$debut" +%s)
echo $t
for f in ls /$HOME/Documents/timelapse/photos/*
do
    echo $f  
    ((t=t+2))
    printf '%(%c)T\n' "$t"
    printf -v nd '%(%Y:%m:%d %H:%M:%S)T\n' "$t"
    echo nd $nd
    exiftool -AllDates="$nd" $f
done


