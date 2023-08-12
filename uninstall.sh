#!/bin/bash


clear
echo "#############################################################"
echo "zram-systemd-uninstaller: aug 2023"
echo "#############################################################"
echo " ███████ ██████   █████  ███    ███ "
echo "    ███  ██   ██ ██   ██ ████  ████ "
echo "   ███   ██████  ███████ ██ ████ ██ "
echo "  ███    ██   ██ ██   ██ ██  ██  ██ "
echo " ███████ ██   ██ ██   ██ ██      ██ "     
echo "#############################################################"
echo "zram-systemd-github: https://github.com/manoel-linux/zram-systemd"
echo "#############################################################"

if [[ $EUID -ne 0 ]]; then
echo " ███████ ██████  ██████   ██████  ██████  ██ "
echo " ██      ██   ██ ██   ██ ██    ██ ██   ██ ██ "
echo " █████   ██████  ██████  ██    ██ ██████  ██ "
echo " ██      ██   ██ ██   ██ ██    ██ ██   ██    "
echo " ███████ ██   ██ ██   ██  ██████  ██   ██ ██ "                                                                                        
echo "#############################################################"
echo "Superuser privileges or sudo required to execute the script." 
echo "#############################################################"
exit 1
fi

sudo systemctl daemon-reload

sudo systemctl stop zramsystemd.service

sudo systemctl disable zramsystemd.service

sudo systemctl daemon-reload

sudo systemctl stop zramsystemd.service

sudo systemctl disable zramsystemd.service

sudo swapoff /dev/zram0

sudo modprobe -r zram

sudo echo 1 > /sys/module/zswap/parameters/enabled

sudo rm /usr/bin/zram-systemd

sudo rm /usr/bin/zram-systemd-version

sudo rm /usr/bin/zram-systemd-change

sudo rm /usr/bin/zram-systemd-start

sudo rm /usr/bin/zram-systemd-stop

sudo rm -rf /etc/systemd/system/zram-systemd

sudo rm -rf /etc/systemd/system/zramsystemd.service

echo " ██████   ██████  ███    ██ ███████ ██ "
echo " ██   ██ ██    ██ ████   ██ ██      ██ "
echo " ██   ██ ██    ██ ██ ██  ██ █████   ██ "
echo " ██   ██ ██    ██ ██  ██ ██ ██         "
echo " ██████   ██████  ██   ████ ███████ ██ " 
echo "#############################################################"
echo "Uninstallation completed."
echo "#############################################################"
