#!/bin/bash
echo 统计controller时间：

logPath=/home/tomcat8/bin/logs/info/info.log

echo 10ms以下:
tail -100 ${logPath}|awk 'BEGIN{sum=0}{if($11<10)sum++;}END{print sum}'

echo 10ms-15ms:
tail -100 ${logPath}|awk 'BEGIN{sum=0}{if(($11<15)&&($11>=10))sum++;}END{print sum}'


echo 15ms以上:
tail -100 ${logPath}|awk 'BEGIN{sum=0}{if($11>15)sum++;}END{print sum}'

