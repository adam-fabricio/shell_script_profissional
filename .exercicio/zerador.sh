#!/bin/bash
#
# zerador.sh
valor=$1
while test $valor -gt "-1"
do
	echo -n "$valor "
	valor=$(($valor - 1 ))
done
echo 
