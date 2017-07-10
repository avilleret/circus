#!/bin/bash
cd ${0%/*}/pd # change to Pd sub directory, relative to this script

pd -mididev 1,2,3,4 control.pd