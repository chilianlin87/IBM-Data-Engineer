#!/usr/bin/env bash

odd=$(echo "$1 % 2" | bc)
echo $odd
if [[ $odd -eq 0 ]]
then
	status="Even"
else
	status="Odd"
fi

if [[ $1 -gt 0 ]] && [[ $1 -lt 10 ]]
then
	location="in"
else
	location="out of"
fi
echo "this number is $status and $location range."

