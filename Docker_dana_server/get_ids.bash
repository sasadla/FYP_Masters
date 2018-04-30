#!/bin/bash
file="./ids_res.txt"
if [ -f "$file" ]
then
	> ./ids_res.txt
fi

docker ps -q -a >> ids_res.txt
