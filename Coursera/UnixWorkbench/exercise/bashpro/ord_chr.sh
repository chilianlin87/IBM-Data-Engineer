#!/usr/bin/bash
#this file is used to change ascii code between character and number

chr() {
	[[ "$1" -lt 256 ]] || return 1;
	printf "\\$(printf '%03o' "$1")";
}
ord() {
	LC_CTYPE=C printf '%d' "'$1";
}

"$@"


