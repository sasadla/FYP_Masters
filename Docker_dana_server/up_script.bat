cd D:\MSCI\Fyp_masters\Fyp_code\FYP_Masters\Docker_dana_server\
if exist up_res.txt break> up_res.txt
if exist down_res.txt break> down_res.txt
docker-compose build
docker-compose up >> up_res.txt
echo d_up_window_exit >> up_res.txt