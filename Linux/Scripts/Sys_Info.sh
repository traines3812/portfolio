#!/bin/bash

if [ $UID -eq 0 ]
then
	echo "Do not run this script with sudo"
	exit
fi


files=('/etc/passwd' '/etc/shadow')


output=~/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1) \n" >>$output
execs=$(find /home -type f -perm 777)


if [ ! -d $HOME/research ]
then
	mkdir $HOME/research
fi

if [ -f $output ]
then
	rm $output
fi


mkdir ~/research 2>/dev/null
echo "A Quick System Audit Script" >$output
date >>$output
echo "" >>$output
echo "Machine Type Info:" >>$output
echo $MACHTYPE >>$output
echo -e "Uname info: $(uname -a) \n" >>$output
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >>$output
echo -e "Hostname: $(hostname -s) \n" >>$output
echo "DNS Servers: " >>$output
cat /etc/resolv.conf >>$output
echo -e "\nMemory Info:" >>$output
free >>$output
echo -e "\nCPU Info:" >>$output
lscpu | grep CPU >>$output
echo -e "\nDisk Usage:" >>$output
df -H | head -2 >>$output
echo -e "\nWho is logged in: \n $(who -a) \n" >>$output
echo -e "\nExec Files:" >>$output

echo $execs  >>$output
echo -e "\nTop 10 Processes" >>$output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >>$output


# Print out the permissions of the files in the files list variable
for file in ${files[@]}
do
	ls -l $file >> $output
done

 for user in  $(ls /home); do sudo -lU $user; done#!/bin/bash

if [ $UID -eq 0 ]
then
	echo "Do not run this script with sudo"
	exit
fi


files=('/etc/passwd' '/etc/shadow')


output=~/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1) \n" >>$output
execs=$(find /home -type f -perm 777)


if [ ! -d $HOME/research ]
then
	mkdir $HOME/research
fi

if [ -f $output ]
then
	rm $output
fi


mkdir ~/research 2>/dev/null
echo "A Quick System Audit Script" >$output
date >>$output
echo "" >>$output
echo "Machine Type Info:" >>$output
echo $MACHTYPE >>$output
echo -e "Uname info: $(uname -a) \n" >>$output
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >>$output
echo -e "Hostname: $(hostname -s) \n" >>$output
echo "DNS Servers: " >>$output
cat /etc/resolv.conf >>$output
echo -e "\nMemory Info:" >>$output
free >>$output
echo -e "\nCPU Info:" >>$output
lscpu | grep CPU >>$output
echo -e "\nDisk Usage:" >>$output
df -H | head -2 >>$output
echo -e "\nWho is logged in: \n $(who -a) \n" >>$output
echo -e "\nExec Files:" >>$output

echo $execs  >>$output
echo -e "\nTop 10 Processes" >>$output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >>$output


# Print out the permissions of the files in the files list variable
for file in ${files[@]}
do
	ls -l $file >> $output
done

 for user in  $(ls /home); do sudo -lU $user; done
