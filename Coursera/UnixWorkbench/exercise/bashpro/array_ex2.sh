#!/usr/bin/env bash

array1=(1 2 3)
array2=(1 2 3 4 5)
echo $((${#array1[*]} + ${#array2[*]}))
