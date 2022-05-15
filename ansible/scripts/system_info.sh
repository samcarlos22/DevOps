#!/bin/bash
echo "-------------------------------System Information----------------------------" > ~/$HOSTNAME
echo "Hostname:         "`hostname` >> ~/$HOSTNAME
echo "uptime:           "`uptime | awk '{print $3,$4}' | sed 's/,//'` >> ~/$HOSTNAME
echo "Machine Type:     "`vserver=$(lscpu | grep Hypervisor | wc -l); if [ $vserver -gt 0 ]; then echo "VM"; else echo "Physical"; fi` >> ~/$HOSTNAME
echo "Operating System: "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-` >> ~/$HOSTNAME
echo "Kernel:           "`uname -r` >> ~/$HOSTNAME
echo "Architecture:     "`arch` >> ~/$HOSTNAME
echo "Processor Name:   "`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed  's/^[ \t]*//'` >> ~/$HOSTNAME
echo "Active User:      "`w | cut -d ' ' -f1 | grep -v USER | xargs -n1` >> ~/$HOSTNAME
echo "System Main IP:   "`hostname -I` >> ~/$HOSTNAME
echo "" >> ~/$HOSTNAME
echo "-------------------------------CPU/Memory Usage------------------------------" >> ~/$HOSTNAME
echo "Memory Usage:     "`free | awk '/Mem/{printf("%.2f%"), $3/$2*100}'` >> ~/$HOSTNAME
echo "Swap Usage:       "`free | awk '/Swap/{printf("%.2f%"), $3/$2*100}'` >> ~/$HOSTNAME
echo "CPU Usage:        "`cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1` >> ~/$HOSTNAME
echo "" >> ~/$HOSTNAME
echo "-------------------------------Disk Usage >80%-------------------------------" >> ~/$HOSTNAME
df -Ph | sed s/%//g | awk '{ if($5 > 80) print $0;}' >> ~/$HOSTNAME
echo "" >> ~/$HOSTNAME

echo "-------------------------------For WWN Details-------------------------------" >> ~/$HOSTNAME
vserver=$(lscpu | grep Hypervisor | wc -l) >> ~/$HOSTNAME
if [ $vserver -gt 0 ]
then
echo "$(hostname) is a VM"  >> ~/$HOSTNAME
else
cat /sys/class/fc_host/host?/port_name  >> ~/$HOSTNAME
fi
echo ""  >> ~/$HOSTNAME

echo "-------------------------------Package Updates-------------------------------"  >> ~/$HOSTNAME
apt list --upgradable  >> ~/$HOSTNAME
echo  "-----------------------------------------------------------------------------"  >> ~/$HOSTNAME
