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

# If current_sourcemod_version is empty, SourceMod was not installed before.
# We copy over the default admins file and enable some plugins that are disabled by default.
# Admittedly, the default admins_simple.ini is for my convenience.
if [ -z "$current_sourcemod_version" ] ; then
	cp ~/server/default_admins_simple.ini csgo/addons/sourcemod/configs/admins_simple.ini

	cd csgo/addons/sourcemod/plugins/disabled
	mv mapchooser.smx ..
	mv nominations.smx ..
	mv rockthevote.smx ..
fi
