#!/usr/bin/bash
#logic and if/else exerise 2

if [[ $(($1%2)) = 0 ]];
then 
	echo "even"
else
	echo 'odd'
fi

echo $1
