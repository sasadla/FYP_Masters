#!/bin/bash
file="./down_res.txt"
if [ -f "$file" ]
then
	> ./down_res.txt
fi

docker-compose down -d >> ./down_res.txt
echo d_down_success >> ./down_res.txt