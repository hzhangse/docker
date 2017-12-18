设置网桥
root@Docker:~# brctl delbr docker0          #删除docker默认网桥

root@Docker:~# brctl addbr docker_new0      #自定义网桥

root@Docker:~# ifconfig docker_new0 192.168.6.1 netmask 255.255.255.0    #给自定义网桥指定IP和子网

root@Docker:~# ifconfig | grep docker_new0  #查看发现自定义网桥已经启动
docker_new0 Link encap:以太网  硬件地址 0a:5b:26:48:dc:04  
          inet 地址:192.168.6.1  广播:192.168.6.255  掩码:255.255.255.0

root@Docker:~# echo 'DOCKER_OPTS="-b=docker_new0"' >> /etc/default/docker #指定网桥写入docker配置文件

root@Docker:~# service docker start          #启动docker

root@Docker:~# ps -ef | grep docker          #成功启动，并且成功加载了docker_new0
root    21345    1  0 18:44 ?        00:00:00 /usr/bin/docker -d  -b=docker_new0

root@Docker:~# brctl show                    #查看当前网桥下是否有容器连接
bridge name              bridge id              STP enabled    interfaces
docker_new0            8000.fa3ce276c3b9            no           

root@Docker:~# docker run -itd CentOS:centos6 /bin/bash                  #创建容器测试

root@Docker:~# pipework docker_new0 -i eth1 $(docker run -itd -p 9197:80 centos:centos6 /bin/bash) 192.168.6.27/24@192.168.6.1 #创建容器,并指定固定IP
格式：pipework  网桥名 -i 指定在那块网卡上配置  <容器名or容器ID>  指定容器内IP/子网@网关  注：容器内网关就是物理机网桥的IP             


sudo pipework docker_new0 -i eth1 667bbd0399cb 192.168.6.27/24@192.168.6.1 
pipework 重启容器，ｉｐ会丢失，所以此方案不可取

sudo docker network create --subnet=172.19.0.0/16 shadownet
sudo docker run --name mysql5.7 -e MYSQL_ROOT_PASSWORD=root --net shadownet --ip 172.19.0.10 -d mysql

sudo docker run --name my-memcache --net shadownet --ip 172.19.0.14 -d -p 11211:11211 memcached memcached -m 64 

sudo docker run --name my-mongodb  --net shadownet --ip 172.19.0.15 -d -p 27017:27017 -p 28017:28017 -e MONGODB_USER="user" -e MONGODB_DATABASE="mydatabase" -e MONGODB_PASS="mypass" tutum/mongodb 

sudo docker run --name my-mongodb-mgr --net shadownet --ip 172.19.0.16 -d -p 29017:80 pataquets/rockmongo 
docker network create --subnet=172.18.0.0/16 shadownet

