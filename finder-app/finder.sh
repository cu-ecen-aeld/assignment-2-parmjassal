#!/bin/bash

if [ $# -lt 2 ]
then
  echo "Required Argument are missing"
  exit 1
fi

if ! [ -d "$1" ]
then
  echo "Directory $1 doesn't exist"
  exit 1
fi

num_files=$(find $1 -type f | wc -l)
matching_files=$(grep -r  "$2" $1 | wc -l)

echo "The number of files are $num_files and the number of matching lines are $matching_files"

