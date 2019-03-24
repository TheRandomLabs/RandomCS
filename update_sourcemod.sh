#!/bin/sh
cd ~/server/csgo

current_metamod_source_version=$(cat current_metamod_source)

# The first argument is the link to Metamod:Source
if [ "$current_metamod_source_version" != "$1" ] ; then
	echo Downloading and extracting Metamod:Source...
	curl $1 | tar -C csgo -xz
	echo $1 > current_metamod_source
fi

current_sourcemod_version=$(cat current_sourcemod)

# The second argument is the link to SourceMod
if [ "$current_sourcemod_version" != "$2" ] ; then
	echo Downloading and extracting SourceMod...
	curl $2 | tar -C csgo -xz
	echo $2 > current_sourcemod
fi

# If current_sourcemod_version is empty, SourceMod was not installed before,
# so we enable some plugins that are disabled by default
if [ -z "$current_sourcemod_version" ] ; then
	cd csgo/addons/sourcemod/plugins/disabled
	mv mapchooser.smx ..
	mv nominations.smx ..
	mv rockthevote.smx ..
fi
