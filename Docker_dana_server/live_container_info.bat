echo My Identity is >> alive_ids.txt
hostname >> alive_ids.txt
::hostname --ip-address >> alive_ids.txt :: for linux machines to get ip
::ipconfig | findstr /R /C:"IPv4 Address" >> alive_ids.txt  for ipv4 list in windows
echo And im running following conainer ids >> alive_ids.txt
docker ps -q -a >> alive_ids.txt