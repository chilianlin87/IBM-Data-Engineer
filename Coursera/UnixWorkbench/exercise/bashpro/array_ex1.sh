#!/usr/bin/env bash

my_array=(red orange green)
value='green'

for i in "${!my_array[@]}"; do
    if [[ "${my_array[$i]}" = "${value}" ]]; then
        echo "${i}";
    fi
done

for i in "${!my_array[@]}"; do
   if [[ "${my_array[$i]}" = "${value}" ]]; then
       echo "${i}";
   fi
done

for item in "${my_array[@]}";do
	if [[ "$item" = "$value" ]]; then
		echo "$item";
	fi
done
