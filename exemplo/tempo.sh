#!/bin/bash

SECONDS=0
# Inicio da função


for a in `seq 0 100000`; do
	echo "$a" > tty5
done
#Termino

duration=$SECONDS

echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."

SECONDS=0

for ((i=0; i<100000; i++))
do
	echo "$i" > tty5
done


#Termino
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."

SECONDS=0

for b in {0..100000}
do
	echo "$b" > tty5
done


duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
