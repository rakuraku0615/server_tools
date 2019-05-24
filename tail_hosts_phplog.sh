#!/bin/bash

# Usage : tail_hosts_phplog.sh [:host_file_path]
# Host file should be written in each host in each line.
if [ "$1" != "" ] && [ -f $1 ]; then
    IFS=$'\n'
    hosts=(`cat $1`)
else
    echo "no argument for file... \n"
    exit 1;
fi

for host in ${hosts[@]}
do
    echo "---------------- $host ----------------"
    ssh $host "tail /var/log/php.log"
    echo "\n"
done

exit 0

