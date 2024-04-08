#!/bin/bash

if [ $# -lt 2 ]
then
  echo "Required Argument are missing"
  exit 1
fi

if [ -d "$1" ]
then
  echo "Given path $1 is not file"
  exit 1  
fi

p_dirname=$(dirname $1)

if ! [ -d $p_dirname ]
then
  mkdir -p $p_dirname	
fi	

if ! [ -f "$1" ]
then
  touch $1
  if [ $? -gt 0 ]
  then
    echo "Failed to create $1"	  
    exit 1
  fi    
fi

echo $2 > $1

if [ $? -gt 0 ]
then
    echo "Failed to write $2 to file $1"
    exit 1
 fi
