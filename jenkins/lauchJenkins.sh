#!/bin/bash
mkdir data
cat > data/log.properties <<EOF
handlers=java.util.logging.ConsoleHandler
jenkins.level=FINEST
java.util.logging.ConsoleHandler.level=FINEST
EOF
sudo docker run --name myjenkins --privileged=true \
--net shadownet --ip 172.19.0.27 \
-p 28080:8080 -p 50000:50000 --env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" \
-v `pwd`/data:/var/jenkins_home -v /home/ryan/.m2:/var/jenkins_home/.m2 -d jenkins
