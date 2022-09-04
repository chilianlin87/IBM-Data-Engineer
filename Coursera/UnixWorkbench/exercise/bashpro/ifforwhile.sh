#!/usr/bin/bash
#file if for while nexsted loops

for i in {1..10};
do
	if [[ $i < 3 ]] || [[ $i > 8 ]];
	then
		j=$i
		while [[ $j > 0 ]];
		do
			echo "i is $i, j is $j";
			let j=$j-1;
		done;
	fi;
done;


