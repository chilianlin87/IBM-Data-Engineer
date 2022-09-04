#!/usr/bin/bash

function fib {
a=0
b=1
for (( i=0;i<$1;i++ ))
do
	echo -n " $a "
	fn=$((a+b))
	a=$b
	b=$fn
done
echo $'\n'
}

