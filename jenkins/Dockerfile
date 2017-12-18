#Author: ryan  sudo docker build -t jenkins:chuangrong .
FROM jenkins
# if we want to install via apt
USER root

RUN apt-get update && apt-get install -y git openssh-server vim-gtk net-tools

RUN service ssh start


RUN mkdir /opt/android-sdk-linux 
WORKDIR  /opt/android-sdk-linux
RUN wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz 
RUN tar -zxvf android-sdk_r24.4.1-linux.tgz


RUN mkdir /opt/gradle-2.14.1
WORKDIR  /opt/gradle-2.14.1
RUN wget https://services.gradle.org/distributions/gradle-2.14.1-all.zip
RUN unzip gradle-2.14.1-all.zip


