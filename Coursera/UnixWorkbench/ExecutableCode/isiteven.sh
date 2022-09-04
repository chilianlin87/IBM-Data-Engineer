#!/usr/bin/bash

#is it even
function isiteven {
if [[ $(($1 % 2)) == 0 ]]
then
	return 1
else
	return 0
fi
}
