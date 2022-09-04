#!/usr/bin/env bash
#example script using bubble sort algorithm in bash

swapDates() {
	local tmp=${dates[$1]}
	dates[$1]=${dates[$2]}
	dates[$2]=$tmp
}

bubblesort() {
	local size=${#dates[@]} #size of sortable items
	echo -e "\nArray size: $size"
	n=$size
	until (( n <= 0 )); do
		newn=0
        echo -e "\nIteration: $((size -n))"
        for ((i=0; i < n; i++)); do
            if ((
                ( ${#dates[i+1]} > 0 ) && ( $(date -d "${dates[i+1]}" +%s) > $(date -d "${dates[i]}" +%s) )
            )); then
                echo swap "${dates[i+1]}" with "$dates[i]}"
                swapDates $((i+1)) $i
                newn=$i
            fi
        done
        n=$newn
    done

    echo -e "Array sorted\n"
}

dates=('Feb 13' 'Jan 17' 'Apr 12' 'Mar 24' 'Apr 5' 'Jan 20')
echo "Unsorted Array: ${dates[@]}"
bubblesort
echo "Sorted Array: ${dates[@]}"


