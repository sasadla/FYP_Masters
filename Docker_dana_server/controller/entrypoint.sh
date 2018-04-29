#!/bin/sh

#while(1) {
  # GET / frontend API data
  # - how many requests 
  
  
  
#  sleep(10);
#}

docker run --rm dana-web-server --label=dana.replica --network dana-web dana-web-service:latest
