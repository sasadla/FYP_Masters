#!/bin/bash
file="inspect_res.txt"
if [ -f "$file" ]
then
	> ./inspect_res.txt
fi

docker inspect $1 > inspect_res.txt