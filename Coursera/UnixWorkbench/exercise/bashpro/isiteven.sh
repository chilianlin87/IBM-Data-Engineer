#!/usr/bin/bash

#is it even
function isiteven {
if [[ $(($1 % 2)) = 0 ]];
then echo 'Even';
else 
echo 'Odd';
fi;
}
