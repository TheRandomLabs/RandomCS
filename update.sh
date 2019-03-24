#!/bin/sh
cd ~/server
./steamcmd.sh +runscript update_csgo.txt

current_metamod_source_version=$(cat csgo/current_metamod_source)

if [ "$current_metamod_source_version" != "$1" ] ; then
	echo Downloading and extracting Metamod:Source...
	curl $1 | tar -C csgo/csgo -xz
	echo $1 > csgo/current_metamod_source
fi

current_sourcemod_version=$(cat csgo/current_sourcemod)

if [ "$current_sourcemod_version" != "$2" ] ; then
	echo Downloading and extracting SourceMod...
	curl $2 | tar -C csgo/csgo -xz
	echo $2 > csgo/current_sourcemod
fi

if [ ! -e ~/.steam/sdk32/steamclient.so ]; then
	mkdir -p ~/.steam/sdk32
	ln -s ~/server/linux32/steamclient.so ~/.steam/sdk32/steamclient.so
fi
