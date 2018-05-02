if exist up_res.txt break> up_res.txt
if exist down_res.txt break> down_res.txt
docker-compose build
docker-compose up >> up_res.txt
echo d_up_window_exit >> up_res.txt