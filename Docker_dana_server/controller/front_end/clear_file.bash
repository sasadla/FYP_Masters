#!/bin/bash

file=$1
if [ -f "$file" ]
then
	> $1
fi