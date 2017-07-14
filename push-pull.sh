#!/bin/bash

cd ${0%/*}

git commit -am "Save the changes"

git push
git pull https master

read  -n 1 -p "Press a key to quit" mainmenuinput

