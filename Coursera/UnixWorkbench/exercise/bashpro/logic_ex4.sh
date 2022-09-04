#!/usr/bin/bash
#logic and if/else exericses 4

if [[ $(date +%u) -eq $1 ]];
then 
	echo "Thank Moses it's Friday"
else
	echo "$(($1-$(date +%u))) more day$([[ $(($1-$(date +%u))) > 1 ]] && echo s) is Friday"
fi
