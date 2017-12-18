#!/bin/bash
sudo docker run  --net shadownet --ip 172.19.0.30  --name my-memcache -d memcached
