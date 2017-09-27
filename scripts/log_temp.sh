#!/bin/bash
#
# from https://askubuntu.com/questions/96957/where-can-i-find-the-log-file-of-my-system-temperature/861716#861716
#
# Log temperature over some time  interval given as days, hours, minutes or seconds.
# enter the variables according to your usage in the following seciton :
duration="$1"  #duration format is  ndnhnmns where n is some number and d is day,
# h is hours, m is minutes and s is seconds. For example, 4d , 4d5h30m , 5m30s, 6h30m30s are all valid.

step="$2"
#----------------------------------------------------------------------
#starting time taken as current
dt=$(date '+%Y-%m-%dT%H:%M:%S');
#et=$(date '+%Y-%m-%dT%H:%M:%S');

#----------------------------------------------------------------------
a=$(dateutils.dadd $dt  $duration )
b=$(dateutils.ddiff $dt $a -f '%S')
echo $a $b

ntimes=$((b/step))
echo $ntimes

log_file=temp-$dt.log


echo "logging...";
rm $log_file
nms=0
while [  $nms -lt $ntimes ];  do
        sensors | grep -A 0  'Core' | cut -c18-21 |tr "\n" "\t" >> temp.txt
        let nms=nms+1
        sleep  $step
        now=$(date +"%m/%d/%Y %T")
        cpu=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{print ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')
#       echo $now
        echo -e "$now\t""$(cat temp.txt)""$cpu"  >> $log_file
        rm temp.txt
done

