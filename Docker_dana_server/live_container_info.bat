if exist status_res.txt break> status_res.txt
echo My Identity is: >> status_res.txt
hostname >> status_res.txt
::hostname --ip-address >> alive_ids.txt :: for linux machines to get ip
::ipconfig | findstr /R /C:"IPv4 Address" >> alive_ids.txt :: for ipv4 list in windows
echo And im running following conainer ids: >> status_res.txt
docker ps -q -a >> status_res.txt
::echo  >>status_res.txt
echo _ >>status_res.txt
echo docker status is: >>status_res.txt
docker ps >> status_res.txt