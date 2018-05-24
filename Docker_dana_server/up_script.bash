#!/bin/bash
if [ -e down_res.txt ] 
then
	> ./down_res.txt
fi
file="./up_res.txt"
if [ -f "$file" ]
then
	> ./up_res.txt
fi

docker-compose up --build -d >> ./up_res.txt
echo d_up_window_exit >> ./up_res.txt
dnc web.dn
dana ws.core