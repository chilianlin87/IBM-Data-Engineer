#!/usr/bin/bash
#logic if/else exercises 3

if [[ $1 =~ [0-9]+ ]] && [[ $2 =~ [0-9]+ ]];
then 
	echo $(($1+$2))
else
	echo $1 " , " $2
fi
