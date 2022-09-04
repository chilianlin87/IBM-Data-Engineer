#!/usr/bin/bash
#how many evens

function nevens {
	local sum=0
	for element in $@
	do
		echo $element
		if isiteven $element;
		then
			echo "Even"
			let sum=sum+1
		fi
	done
	echo $sum
}

