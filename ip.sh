#!/bin/bash
dirfile='/home/ip_change'
new_ip=`curl icanhazip.com`    #获取新公网ip
log="/root/Rabbit/tool.log"
datetime=`date '+%Y-%m-%d %H:%M:%S'`
#判断文件是否存在
if [ ! -f "$dirfile" ]; then
  touch "$file"
  echo "1.1.1.1" > $dirfile
fi
#判断new_ip是否获取

if [ ! -n "$new_ip" ]; then
    echo "$datetime 公网IP获取失败，检查'curl icanhazip.com' " >> $log
    exit 1
fi
old_ip=`cat $dirfile`     #查看旧ip
if [ "$new_ip" = "$old_ip" ]; then
  echo "$datetime IP正常 - true " >> $log
else
  echo  $new_ip > $dirfile
  echo "IP已经发生变化, 新IP: $new_ip   旧IP： $old_ip  " | docker restart rabbit 
  echo "$datetime IP已经发生变化 - error 新IP ：$new_ip    IP： $old_ip " >> $log
fi
