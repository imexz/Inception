#!/bin/bash

ID=$(id -u)
if [ $ID != "0" ];
then
    echo "Execute as root/sudo user!"
    exit
fi

if [ ! -d "$HOME/data" ];
then
    echo "Creating ~/data/ ~/data/mysql/ ~data/www/"
    mkdir "$HOME/data";
    mkdir "$HOME/data/mysql";
    mkdir "$HOME/data/www";
fi

if ! grep -q mstrantz.42.fr /etc/hosts;
then
    echo "Changing /etc/hosts file: Redirect domain name to localhost 127.0.0.1"
    sed -i '1s/^/127.0.0.1  mstrantz.42.fr\n/' /etc/hosts;
    sed -i '1s/^/127.0.0.1  www.mstrantz.42.fr\n/' /etc/hosts;
fi
