#!/bin/bash

ips="
10.1.50.111
10.1.50.102
10.1.50.140
"
for ip in $ips
do
    # ssh ${ip}
    expect -c "
           set timeout 1;
           spawn ssh root@${ip} -p 22  ;
           expect {
               yes/no { send \"yes\r\"; exp_continue }
           } ;
           expect root@${ip}  { send exit\r } ;
           expect eof ;
       "
done
