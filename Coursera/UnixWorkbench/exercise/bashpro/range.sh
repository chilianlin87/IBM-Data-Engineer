#!/usr/bin/env bash

function range {
if [[ $1 -ge 0 ]]; then
	eval echo {0..$1}
else
	eval echo {$1..0}
fi
}

