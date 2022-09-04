#!/usr/bin/bash

#if loop

for number in {1..10};
do
	if [[ $number < 3 ]] || [[ $number > 8 ]];
	then 
		echo "number is $number"
	fi;
done;

