#!/bin/sh
cd ~/server
csgo/srcds_run -debug -game csgo -tickrate 128 $@
