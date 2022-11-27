#!/bin/bash
#
# juntatudo.sh

i=0
while test $# -ne $i
do
	i=$(($i+1))
	echo -n ${!i}
done
echo
