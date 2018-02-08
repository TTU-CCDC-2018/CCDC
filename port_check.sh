#!/bin/bash
declare -a pid
echo PID
while read LINE; do
        pid[$n]=$LINE
        echo "${pid[$n]}"
        let n=$n+1
done < <(netstat -tlnp | awk '{print $7}' | grep [0-9] | cut -d "/" -f1)

declare -a ports
echo 'LOCALPORT'
while read LINE; do
        ports[$n]=$LINE
        echo "${ports[$n]}"
        let n=$n+1
done < <(netstat -tlnp | awk '{print $4}' | grep [0-9] | sed -e 's/.*://')
