#!/bin/sh

#The purpose of the script allows quick swapping of mcserver versions, this replaces the server.jar to the desired version at the speed of your internet.

#This script is compatible on Centos7
#This script was paired with LGSM (LinuxGameServerManager) install of Minecraft, if you don't use that probably best to modify removing ./mcserver type stuff

echo 'Welcome to Gregs update script for minecraft' \n
echo 'Stopping server with command: ./mcserver stop'\n
./mcserver stop
echo 'Select a Version'\n
echo '1: version 1.12.2'
echo '2: version 1.12.1'
echo '3: version 1.12'
echo '4: version 1.11.2'
echo '5: version 1.11.1'
echo '6: version 1.11'
echo 'Any other key to update to latest'\n
read e

#Links to updates
update1='https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar'
update2='https://launcher.mojang.com/mc/game/1.12.1/server/561c7b2d54bae80cc06b05d950633a9ac95da816/server.jar'
update3='https://launcher.mojang.com/mc/game/1.12/server/8494e844e911ea0d63878f64da9dcc21f53a3463/server.jar'
update4='https://launcher.mojang.com/mc/game/1.11.2/server/f00c294a1576e03fddcac777c3cf4c7d404c4ba4/server.jar'
update5='https://launcher.mojang.com/mc/game/1.11.1/server/1f97bd101e508d7b52b3d6a7879223b000b5eba0/server.jar'
update6='https://launcher.mojang.com/mc/game/1.11/server/48820c84cb1ed502cb5b2fe23b8153d5e4fa61c0/server.jar'

case $e in
		#VERSION 1.12.2
        1) version = '1.12.2'
		cd /home/mcserver/serverfiles/ ; echo 'Current Directory' $PWD ; echo 'updating to version 1.12.2' \n
		wget -O minecraft_server.jar $update1 ;;
		#VERSION 1.12.1
        2) version = '1.12.1'
		cd /home/mcserver/serverfiles/ ; echo 'Current Directory' $PWD ; echo 'updating to version 1.12.1' \n
		wget -O minecraft_server.jar $update2 ;;
		#VERSION 1.12
        3) version = '1.12'
		cd /home/mcserver/serverfiles/ ; echo 'Current Directory' $PWD ; echo 'updating to version 1.12' \n
		wget -O minecraft_server.jar $update3 ;;
		#VERSION 1.11.2
        4) version = '1.11.2'
		cd /home/mcserver/serverfiles/ ; echo 'Current Directory' $PWD ; echo 'updating to version 1.11.2' \n
		wget -O minecraft_server.jar $update4 ;;
		#VERSION 1.11.1
        5) version = '1.11.1'
		cd /home/mcserver/serverfiles/ ; echo 'Current Directory' $PWD ; echo 'updating to version 1.11.1' \n
		wget -O minecraft_server.jar $update5 ;;
		#VERSION 1.11
        6) version = '1.11'
		cd /home/mcserver/serverfiles/ ; echo 'Current Directory' $PWD ; echo 'updating to version 1.11' \n
		wget -O minecraft_server.jar $update6 ;;
		#UPDATE TO LATEST VERSION USING LGSM
        *) version = 'latest version'
		echo 'updating to latest'
		echo 'running command: ./mcserver update' \n
		cd /home/mcserver
		./mcserver update
                ;;
esac

#Inform what the server has been updated to.
echo 'server has been updated to' $version \n
#Prompt user to start server
while true; do
    read -p "Do you wish to start the minecraft server[y/n]?" yn
    case $yn in
        [Yy]* ) cd /home/mcserver; ./mcserver start; break;;
        [Nn]* ) echo 'To start the server "./mcserver start" in respective dir';exit;;
        * ) echo "Please answer yes or no.";;
    esac
done