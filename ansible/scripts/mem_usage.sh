#!/bin/bash

## output: Hostname, Date&Time, CPU%, Mem%, Disk%
HOSTNAME=$(hostname)
DATET=$(date "+%Y-%m-%d %H:%M:%S")
CPUSAGE=$(top -b -n 1 -d1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')
MEMUSAGE=$(free | grep Mem | awk '{printf("%.0f\n", $3 / $2 * 100.0)}')
DISKUSAGE=$(df -P | column -t | awk '{print $5,"==>",$6," | "}' | awk 'NR!=1')

OUTPUT=$HOSTNAME","$DATET","$CPUSAGE","$MEMUSAGE","$DISKUSAGE
echo $OUTPUT > ~/$HOSTNAME