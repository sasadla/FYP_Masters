cd D:\MSCI\Fyp_masters\Fyp_code\FYP_Masters\Docker_dana_server\
if exist down_res.txt break> down_res.txt
docker-compose down >> down_res.txt
echo d_down_success >> down_res.txt