#!/bin/bash

cd ${0%/*}

git commit -am "Save the changes"

git push 
git pull