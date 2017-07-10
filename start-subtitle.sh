#!/bin/bash
cd ${0%/*}/pd # change to Pd sub directory, relative to this script

pd -noaudio -lib Gem -path /usr/local/lib/pd/extra/Gem photoscratch.pd
