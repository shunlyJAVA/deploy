#!/bin/bash
logPath=/usr/local/nginx/logs/access.log
echo 选取100次响应：


echo 耗时0.001s以下的：
tail -100 ${logPath}|awk 'BEGIN{sum=0}{if($14<0.001)sum++;}END{print sum}'

echo 耗时0.001s-0.005s的：
tail -100 ${logPath}|awk 'BEGIN{sum=0}{if(($14<0.005)&&($14>0.001))sum++;}END{print sum}'

echo 耗时0.005s-0.01s的：
tail -100 ${logPath}|awk 'BEGIN{sum=0}{if(($14<0.01)&&($14>0.005))sum++;}END{print sum}'

echo 耗时0.01s-0.1s的：
tail -100 ${logPath}|awk 'BEGIN{sum=0}{if(($14<0.1)&&($14>0.01))sum++;}END{print sum}'

echo 耗时0.1s以上的：
tail -100 ${logPath}|awk 'BEGIN{sum=0}{if($14>0.1)sum++;}END{print sum}'

