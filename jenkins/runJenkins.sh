#!/bin/bash
docker run -d --name myjenkins  --privileged=true \
--net shadownet --ip 172.19.0.27 \
--publish 28080:8080 -p 50000:50000 --env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties"  \
--volume `pwd`/data:/var/jenkins_home jenkins:chuangrong
