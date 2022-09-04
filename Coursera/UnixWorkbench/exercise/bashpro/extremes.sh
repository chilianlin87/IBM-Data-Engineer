#!/usr/bin/env bash
#this program prints min and max of a given sequence

#function extremes {
#if [[ $# -eq 1 ]]
#then
#	echo "min = max = $1";

#elif [[ $# -eq 2 ]]
#then
#	if [[ $1 -le $2 ]]
#	then
#		echo "min = $1, max = $2"
#	else
#		echo "min = $2, max = $1"
#	fi
#else
#	min=$1
#	max=$1
#	for element in $@
#	do
#		if [[ $element -gt max ]];then
#			max=$element
#		fi
		
#		if [[ $element -lt min ]];then
#			min=$element
#		fi
#	done
#	echo "min=$min, max=$max"

#fi
#}

function extremes {
min=$1
max=$1
for element in $@
do
	if [[ $element -gt $max ]]; then
		max=$element
	fi
	if [[ $element -lt $min ]]; then
		min=$element
	fi
done
echo "min=$min, max=$max"
}

