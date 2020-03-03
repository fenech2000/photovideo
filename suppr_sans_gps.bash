#!/bin/bash
for f in ls /$HOME/Documents/timelapse/photos/*
do
    echo $f
    exif $f | grep "GPS"
    if [ $? != 0 ]; then
	    echo "echec $f"
	    rm $f
    fi
done


