#!/bin/bash

cd ${0%/*}/pd # change to Pd sub directory, relative to this script

pd control.pd &

sleep 1

pd -noaudio -lib Gem -path /usr/local/lib/pd/extra/Gem videoscratch.pd &
