#!/bin/bash
sudo docker run --name redis -d --net shadownet --ip 172.19.0.31 \
  --publish 6379:6379 \
  --env 'REDIS_PASSWORD=redis' \
  --volume /home/ryan/work/tools/docker/redis:/var/lib/redis \
  sameersbn/redis:latest --appendonly yes --logfile /var/lib/redis/redis-server.log
