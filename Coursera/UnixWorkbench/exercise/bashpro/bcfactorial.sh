#!/usr/bin/bash
#this function can calculate factorial!
define f (x) {
	if (x <= 1) return (1);
	return (f(x-1) * x);
}
