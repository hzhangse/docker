#!/bin/sh
sudo docker run --name mysql10 --net shadownet --ip 172.19.0.10  -v /home/ryan/work/tools/docker/java-mysql/mysql.conf:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
