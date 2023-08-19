#!/bin/bash

clear

show_main_menu() {
while true; do
clear
echo "#################################################################"
echo "zram-systemd-installer >> (aug 2023)"
echo "#################################################################"
echo " ███████ ██████   █████  ███    ███ "
echo "    ███  ██   ██ ██   ██ ████  ████ "
echo "   ███   ██████  ███████ ██ ████ ██ "
echo "  ███    ██   ██ ██   ██ ██  ██  ██ "
echo " ███████ ██   ██ ██   ██ ██      ██ "    
echo "#################################################################"
echo "zram-systemd-github >> (https://github.com/manoel-linux/zram-systemd)"
echo "#################################################################"

if [[ $EUID -ne 0 ]]; then
echo " ███████ ██████  ██████   ██████  ██████  ██ "
echo " ██      ██   ██ ██   ██ ██    ██ ██   ██ ██ "
echo " █████   ██████  ██████  ██    ██ ██████  ██ "
echo " ██      ██   ██ ██   ██ ██    ██ ██   ██    "
echo " ███████ ██   ██ ██   ██  ██████  ██   ██ ██ "                                                                                        
echo "#################################################################"
echo "Superuser privileges or sudo required to execute the script." 
echo "#################################################################"
exit 1
fi

sudo pacman -Sy
sudo pacman -S iputils -y
echo "#################################################################"
sudo apt-get update
sudo apt-get install --no-install-recommends inetutils-ping -y
echo "#################################################################"

clear

echo "#################################################################"
echo "(1)> (Install) the ZRAM-SYSTEMD version of Ubuntu/Debian"
echo "(2)> (Install) the ZRAM-SYSTEMD version of Arch-Manjaro"
echo "(3)> (Exit)"
echo "#################################################################"

read -p "Enter your choice: " choice
echo "#################################################################"

case $choice in
1)
show_ubuntu-debian
;;
2)
show_arch-manjaro
;;
3)
exit 0
;;
*)
echo "Invalid choice. Please try again."
echo "#################################################################"
sleep 2
;;
esac
done
}

show_ubuntu-debian() {
while true; do
clear
if [ ! -x /bin/systemctl ]; then
echo "#################################################################"
echo "(Warning!) >> Your system doesn't have systemd."
echo "#################################################################"
exit 1
fi
if [ ! -x /bin/apt ]; then
echo "#################################################################"
echo "(Warning!) >> You are trying to run a version meant for another distribution. 
To prevent issues, the script has blocked a warning to execute the version meant for your distribution."
echo "#################################################################"
exit 1
fi
echo "#################################################################"
echo "Checking for updates in Ubuntu/Debian..." 
echo "#################################################################"
sudo apt-get update
sudo apt-get install --no-install-recommends unzip binutils tar curl xz-utils grep gawk sed -y
clear
echo "#################################################################"

read -p "Do you want to update your system? (y/n): " choice
echo "#################################################################"
if [[ $choice == "y" || $choice == "Y" ]]; then
sudo apt-get update
sudo apt-get upgrade -y
else
echo "Skipping system update."
echo "#################################################################"
fi

clear

sudo rm -rf /usr/bin/zram-systemd

sudo cp systemd/zram-systemd /usr/bin/

clear

echo "#################################################################"
read -p "Enter the desired size for ZRAM (e.g., 2G or 4G or 8G): " zram_size_input
echo "#################################################################"

if [[ $zram_size_input == *GB ]]; then
echo "#################################################################"
echo "Please enter the size with 'G' in uppercase, for example: 2G or 4G or 8G"
echo "#################################################################"
exit 1
fi

if [[ $zram_size_input == *gb ]]; then
echo "#################################################################"
echo "Please enter the size with 'G' in uppercase, for example: 2G or 4G or 8G"
echo "#################################################################"
exit 1
fi

if [[ $zram_size_input == *g ]]; then
echo "#################################################################"
echo "Please enter the size with 'G' in uppercase, for example: 2G or 4G or 8G"
echo "#################################################################"
exit 1
fi

zram_size="${zram_size_input//G}"
read -p "Choose a compression algorithm (l for lz4, z for zstd): " selected_algorithm
echo "#################################################################"
case $selected_algorithm in
l)
compression_algorithm="lz4"
;;
z)
compression_algorithm="zstd"
;;
*)
echo "Invalid choice. Using the default algorithm (lz4)."
echo "#################################################################"
compression_algorithm="lz4"
;;
esac

read -p "Enter the desired priority for ZRAM (e.g., 100 or 200): " zram_priority
echo "#################################################################"

if [[ $zram_priority == "10%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "20%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "30%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "40%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "50%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "60%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "60%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "70%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "80%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "90%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "100%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "110%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "120%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "130%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "140%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "150%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "160%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "170%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "180%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "190%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "200%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "210%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "220%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "230%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "240%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "250%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "260%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "270%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "280%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "290%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "300%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "310%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "320%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "330%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "340%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "350%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "360%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "300%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "370%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "380%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "390%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "400%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "410%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "420%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "430%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "440%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "450%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "460%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "470%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "480%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "490%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "500%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

echo "#!/bin/bash

echo 0 > /sys/module/zswap/parameters/enabled
modprobe zram
zramctl /dev/zram0 --algorithm $compression_algorithm --size ${zram_size}G
mkswap -U clear /dev/zram0
swapon --priority $zram_priority /dev/zram0" > systemd/zram-systemd

sudo systemctl daemon-reload

sudo systemctl stop zramsystemd.service

sudo systemctl disable zramsystemd.service

sudo systemctl daemon-reload

sudo systemctl stop zramsystemd.service

sudo systemctl disable zramsystemd.service

sudo swapoff /dev/zram0

sudo modprobe -r zram

sudo echo 1 > /sys/module/zswap/parameters/enabled

sudo rm -rf /usr/bin/zram-systemd-version

sudo rm -rf /usr/bin/zram-systemd-change

sudo rm -rf /usr/bin/zram-systemd-start

sudo rm -rf /usr/bin/zram-systemd-stop

sudo rm -rf /etc/systemd/system/zram-systemd

sudo rm -rf /etc/systemd/system/zramsystemd.service

sudo cp systemd/zram-systemd /etc/systemd/system/

sudo cp systemd/zramsystemd.service /etc/systemd/system/

sudo cp systemd/zram-systemd-version /usr/bin/

sudo cp systemd/zram-systemd-change /usr/bin/

sudo cp systemd/zram-systemd-start /usr/bin/

sudo cp systemd/zram-systemd-stop /usr/bin/

sudo chmod +x /etc/systemd/system/zram-systemd

sudo chmod +x /usr/bin/zram-systemd-version

sudo chmod +x /usr/bin/zram-systemd-change

sudo chmod +x /usr/bin/zram-systemd-start

sudo chmod +x /usr/bin/zram-systemd-stop

sudo systemctl daemon-reload

sudo systemctl enable zramsystemd.service

sudo systemctl start zramsystemd.service

sudo systemctl daemon-reload

sudo systemctl enable zramsystemd.service

sudo systemctl start zramsystemd.service

clear

echo "#################################################################"
echo " ██████   ██████  ███    ██ ███████ ██ "
echo " ██   ██ ██    ██ ████   ██ ██      ██ "
echo " ██   ██ ██    ██ ██ ██  ██ █████   ██ "
echo " ██   ██ ██    ██ ██  ██ ██ ██         "
echo " ██████   ██████  ██   ████ ███████ ██ "  
echo "#################################################################"
echo "Installation/Update completed."
echo "#################################################################"
echo "To change the zram-systemd configuration, use the command: sudo zram-systemd-change"
echo "To stop the zram-systemd, use the command: sudo zram-systemd-stop"
echo "To start the zram-systemd, use the command: sudo zram-systemd-start"
echo "To check the version of zram-systemd, use the command: sudo zram-systemd-version"
echo "#################################################################"  
read -p "To apply the changes, you need to restart system. (y/n): " confirm
                
if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
echo "#################################################################"
echo "Restarting the system..."    
echo "#################################################################"
sudo reboot
else
echo "#################################################################"
echo "Restart canceled."
echo "#################################################################"
fi
read -rsn1 -p "press Enter to return to the main menu
#################################################################" key
if [[ $key == "r" || $key == "R" ]]; then
continue
fi

break
done

echo "#################################################################"
}

show_arch-manjaro() {
while true; do
clear
if [ ! -x /bin/systemctl ]; then
echo "#################################################################"
echo "(Warning!) >> Your system doesn't have systemd."
echo "#################################################################"
exit 1
fi
if [ ! -x /bin/pacman ]; then
echo "#################################################################"
echo "(Warning!) >> You are trying to run a version meant for another distribution. 
To prevent issues, the script has blocked a warning to execute the version meant for your distribution."
echo "#################################################################"
exit 1
fi
echo "#################################################################"
echo "Checking for updates in Arch/Manjaro..." 
echo "#################################################################"
sudo pacman -Sy
sudo pacman -S unzip binutils tar curl xz grep gawk sed -y
clear
echo "#################################################################"

read -p "Do you want to update your system? (y/n): " choice
echo "#################################################################"
if [[ $choice == "y" || $choice == "Y" ]]; then
sudo pacman -Sy
sudo pacman -Syu -y
else
echo "Skipping system update."
echo "#################################################################"
fi

clear

sudo rm -rf /usr/bin/zram-systemd

sudo cp systemd/zram-systemd /usr/bin/

clear

echo "#################################################################"
read -p "Enter the desired size for ZRAM (e.g., 2G or 4G or 8G): " zram_size_input
echo "#################################################################"

if [[ $zram_size_input == *GB ]]; then
echo "#################################################################"
echo "Please enter the size with 'G' in uppercase, for example: 2G or 4G or 8G"
echo "#################################################################"
exit 1
fi

if [[ $zram_size_input == *gb ]]; then
echo "#################################################################"
echo "Please enter the size with 'G' in uppercase, for example: 2G or 4G or 8G"
echo "#################################################################"
exit 1
fi

if [[ $zram_size_input == *g ]]; then
echo "#################################################################"
echo "Please enter the size with 'G' in uppercase, for example: 2G or 4G or 8G"
echo "#################################################################"
exit 1
fi

zram_size="${zram_size_input//G}"
read -p "Choose a compression algorithm (l for lz4, z for zstd): " selected_algorithm
echo "#################################################################"
case $selected_algorithm in
l)
compression_algorithm="lz4"
;;
z)
compression_algorithm="zstd"
;;
*)
echo "Invalid choice. Using the default algorithm (lz4)."
echo "#################################################################"
compression_algorithm="lz4"
;;
esac

read -p "Enter the desired priority for ZRAM (e.g., 100 or 200): " zram_priority
echo "#################################################################"

if [[ $zram_priority == "10%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "20%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "30%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "40%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "50%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "60%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "60%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "70%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "80%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "90%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "100%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "110%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "120%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "130%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "140%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "150%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "160%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "170%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "180%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "190%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "200%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "210%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "220%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "230%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "240%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "250%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "260%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "270%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "280%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "290%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "300%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "310%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "320%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "330%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "340%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "350%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "360%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "300%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "370%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "380%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "390%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "400%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "410%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "420%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "430%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "440%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "450%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "460%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "470%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "480%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "490%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "500%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

if [[ $zram_priority == "%" ]]; then
zram_priority="100"
echo "Automatic priority (100) chosen."
echo "#################################################################"
fi

echo "#!/bin/bash

echo 0 > /sys/module/zswap/parameters/enabled
modprobe zram
zramctl /dev/zram0 --algorithm $compression_algorithm --size ${zram_size}G
mkswap -U clear /dev/zram0
swapon --priority $zram_priority /dev/zram0" > systemd/zram-systemd

sudo systemctl daemon-reload

sudo systemctl stop zramsystemd.service

sudo systemctl disable zramsystemd.service

sudo swapoff /dev/zram0

sudo modprobe -r zram

sudo echo 1 > /sys/module/zswap/parameters/enabled

sudo rm -rf /usr/bin/zram-systemd-version

sudo rm -rf /usr/bin/zram-systemd-change

sudo rm -rf /usr/bin/zram-systemd-start

sudo rm -rf /usr/bin/zram-systemd-stop

sudo rm -rf /etc/systemd/system/zram-systemd

sudo rm -rf /etc/systemd/system/zramsystemd.service

sudo cp systemd/zram-systemd /etc/systemd/system/

sudo cp systemd/zramsystemd.service /etc/systemd/system/

sudo cp systemd/zram-systemd-version /usr/bin/

sudo cp systemd/zram-systemd-change /usr/bin/

sudo cp systemd/zram-systemd-start /usr/bin/

sudo cp systemd/zram-systemd-stop /usr/bin/

sudo chmod +x /etc/systemd/system/zram-systemd

sudo chmod +x /usr/bin/zram-systemd-version

sudo chmod +x /usr/bin/zram-systemd-change

sudo chmod +x /usr/bin/zram-systemd-start

sudo chmod +x /usr/bin/zram-systemd-stop

sudo systemctl daemon-reload

sudo systemctl enable zramsystemd.service

sudo systemctl start zramsystemd.service

sudo systemctl daemon-reload

sudo systemctl enable zramsystemd.service

sudo systemctl start zramsystemd.service

clear

echo "#################################################################"
echo " ██████   ██████  ███    ██ ███████ ██ "
echo " ██   ██ ██    ██ ████   ██ ██      ██ "
echo " ██   ██ ██    ██ ██ ██  ██ █████   ██ "
echo " ██   ██ ██    ██ ██  ██ ██ ██         "
echo " ██████   ██████  ██   ████ ███████ ██ "  
echo "#################################################################"
echo "Installation/Update completed."
echo "#################################################################"
echo "To change the zram-systemd configuration, use the command: sudo zram-systemd-change"
echo "To stop the zram-systemd, use the command: sudo zram-systemd-stop"
echo "To start the zram-systemd, use the command: sudo zram-systemd-start"
echo "To check the version of zram-systemd, use the command: sudo zram-systemd-version"
echo "#################################################################"  
read -p "To apply the changes, you need to restart system. (y/n): " confirm
                
if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
echo "#################################################################"
echo "Restarting the system..."    
echo "#################################################################"
sudo reboot
else
echo "#################################################################"
echo "Restart canceled."
echo "#################################################################"
fi
read -rsn1 -p "press Enter to return to the main menu
#################################################################" key
if [[ $key == "r" || $key == "R" ]]; then
continue
fi

break
done

echo "#################################################################"
}

show_main_menu
