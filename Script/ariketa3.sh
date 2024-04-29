#!/bin/bash

echo "Idatzi lehenengo izena hemen"

read IZENA1

echo "Idatzi bigarren izena hemen"

read IZENA2

if [ $IZENA1 = $IZENA2 ]; then 
            echo "$IZENA1 eta $IZENA2 berdinak dira"

fi

if [ $IZENA1 != $IZENA2 ]; then
            echo "$IZENA1 eta $IZENA2 ez dira berdinak"

fi