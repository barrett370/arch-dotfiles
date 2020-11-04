#!/bin/bash

cd $HOME/Documents/kbconfigs
cp $1 $HOME/applications/alt-flasher/
cd $HOME/applications/alt-flasher
sudo ./mdloader_linux --first --download $1 --restart
rm $1
