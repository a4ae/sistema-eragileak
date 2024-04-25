#!/bin/bash

for ruta in "$@"
do

    if [ -f $ruta ]; then
        echo "$ruta edukia"
        cat $ruta
    else
        echo "$ruta ez da existitzen" 
    fi
done