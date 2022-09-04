#!/usr/bin/env bash


echo "Script arguments: $@"
no1=$1
no2=$2
echo "first number: $no1. Second number $no2."
sumis=`expr $no1 + $no2`
echo "sum is $sumis"
sum1=$(expr $no1 + $no2)
echo "sum1 is $sum1"
sum2=$(($no1+$no2))
echo "sum2 is $sum2"
sum3=$(($1+$2))
echo "sum3 is $sum3"
echo "the number of arguments: $#"
echo "first argument times the number of arguments is: $(($no1 * $#))"
