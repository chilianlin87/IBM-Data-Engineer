#!/usr/bin/bash

#this program would add every element of input, then export the cum sum

function addseq {
sum=0
for element in $@;
do
let sum=sum+$element
done
echo $sum
}
