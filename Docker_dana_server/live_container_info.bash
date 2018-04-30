#!/bin/bash
file="./status_res.txt"
if [ -f "$file" ]
then
	> ./status_res.txt
fi

echo My Identity is: >> ./status_res.txt
hostname --ip-address >> ./status_res.txt
echo And im running following conainer ids: >> ./status_res.txt
docker ps -q -a >> ./status_res.txt
echo _ >>./status_res.txt
echo docker status is: >>./status_res.txt
docker ps >> ./status_res.txt