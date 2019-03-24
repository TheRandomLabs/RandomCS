#!/bin/sh
cd ~/server
./steamcmd.sh +runscript update_csgo.txt

# https://developer.valvesoftware.com/wiki/SteamCMD#Unable_to_locate_a_running_instance_of_Steam
if [ ! -e ~/.steam/sdk32/steamclient.so ]; then
	mkdir -p ~/.steam/sdk32
	ln -s ~/server/linux32/steamclient.so ~/.steam/sdk32/steamclient.so
fi

./update_sourcemod.sh $1 $2
