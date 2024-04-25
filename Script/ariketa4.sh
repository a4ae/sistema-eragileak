#!/bin/bash

echo "Lehenengo balioa idatzi"

read ZENBAKIA1

echo "Bigarren balioa idatzi"

read ZENBAKIA2

echo "Kalkulo mota idatzi"

read CALC

expr $ZENBAKIA1 $CALC $ZENBAKIA2
