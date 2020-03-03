#!/bin/bash
nbproc=$(cat /proc/cpuinfo | grep processor | wc -l)
nbthread=$(( $nbproc-1 ))
echo $nbthread
for f in $HOME/*
do
	tailleNom=${#f}
    echo $f; sleep $(($tailleNom/3)) &
	
	nbsp=$(pgrep -c -P $$)
	while (($nbsp >= $nbthread)); do
		sleep .5
		nbsp=$(pgrep -c -P $$)
	done
done