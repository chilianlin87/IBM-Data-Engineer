#!/usr/bin/bash

testA() {
	echo "test A $1";
}

testB() {
	echo "test B $2";
}

"$@"

