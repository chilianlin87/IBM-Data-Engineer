#!/usr/bin/bash
#how many evens

function nevens {
	local sum=0
	for element in $@
	do
		if [[ $(($element % 2)) == 0 ]]
		then 
			let sum=sum+1
		fi
	done
	echo $sum
}

