#!/bin/bash
cd dana_ubu64_[219]/components/ws
#compile ws.core_mod file in dana directory
dnc core_mod.dn

cd ..
cd ..
cd ..
cd Docker_dana_server
#compile controller supprot files
dnc requester.dn
dnc web.dn
#make bash scripts runable
sudo chmod +x d_inspect.bash
sudo chmod +x down_script.bash
sudo chmod +x up_script.bash
sudo chmod +x get_ids.bash
sudo chmod +x clear_file.bash
sudo chmod +x live_container_info.bash

cd controller
#compile controller files
dnc cntrlr.dn
dnc gen_csv.dn
dnc ts.dn
#make bash scripts runable
sudo chmod +x clear_file.bash
sudo chmod +x run_controller_fe.sh
sudo chmod +x run_fe.sh
