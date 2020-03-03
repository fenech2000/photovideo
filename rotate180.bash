#!/bin/bash

# TODO : faire un vrai multithreading

nbthread=6
cpt=0

for f in ls /$HOME/Documents/timelapse/photos/*
do
    echo $f
    f2=$(echo $f | cut -d'.' -f 1) 
    echo $f2 &
    /usr/bin/convert $f -rotate 180 -orient TopLeft "${f2}.180.JPG" && rm $f &
    #rm $f
    ((cpt++))
    if (( $cpt >= $nbthread )); then
        echo "echo $cpt en cours, on attend...."
        wait
        cpt=0
    fi
done


