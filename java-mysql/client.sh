#!/bin/sh

sudo docker run -it --net shadownet --ip 172.19.0.18 --rm mysql mysql -h172.19.0.10 -uroot -p 
