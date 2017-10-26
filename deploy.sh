#!/bin/bash
# 关闭tomcat
cd /home
./stop.sh

# 查找war并删除
find /home/tomcat8/webapps/ -maxdepth 1 -name *.war|xargs rm -rf

#上传
cd /home/tomcat8/webapps
rz

#开启tomcat
cd /home
./start.sh
