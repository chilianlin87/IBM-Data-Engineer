#! /bin/bash

dircount=$(find $1 -type d|wc -l)

filecount=$(find $1 -type f|wc -l)

echo "there are $dircount directories in the directory $1"

echo "there are $filecount files in the directory $1"


