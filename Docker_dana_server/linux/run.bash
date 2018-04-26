#!/bin/bash

#ls list directories
#env list all enviornment variables

dnc web.dn
dnc text_page.dn
dnc image_page.dn
dnc image_text_page.dn
echo "Dana Component running on "
echo "Container-IP is: " 
hostname --ip-address 
dana ws.core