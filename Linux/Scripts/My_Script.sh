#!/bin/bash
echo "A Quick System Audit Script"
date
echo "Machine Type Infor:"
echo $MACHTYPE
echo -e "Uname info: $(uname -a) \n"
echo -e "IP Info: $(ip addr | head -9 | tail -1) \n"
echo "Hostname: $(hostname -s)"
# BONUS SECTION

echo "DNS Server: "
cat /etc/resolv.conf | tail -2
