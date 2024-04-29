#!/bin/bash

jarraitu=0

while [ "$jarraitu" = 0 ]; do

echo "Kaixo aukera hauetatik bat aukeratu
1. Karpeta tamaina ikusi
2. Fitxategiak listatu
3. Fitxategi bat sortu
4. Karpeta sortu
5. Karpeta eta fitxategiak ezabatu
6. Irten"

read -r aukera

if [ "$aukera" = 1 ]; then
    du -h
elif [ "$aukera" = 2 ]; then
    ls 
elif [ "$aukera" = 3 ]; then
    echo "Jarri fitxategiaren izena"
    read izena_fitxategia 
    nano $izena_fitxategia
elif [ "$aukera" = 4 ]; then
    echo "Jarri karpetaren izena"
    read izena_karpeta 
    mkdir $izena_karpeta
elif [ "$aukera" = 5 ]; then
    echo "Aukeratu karpeta edo fitxategia"
    read aukera2
    if [ "$aukera2" = karpeta ]; then
        echo "Karpetaren izena jarri"
        read karpeta_izena
        rmdir $karpeta_izena
    else
        echo "fitxategiaren izena jarri"
        read fitxategi_izena
        rm $fitxategi_izena
    fi
elif [ "$aukera" = 6 ]; then
    clear
    jarraitu=1
else
    echo "ERROR"
fi

done