#!/bin/bash
#
#  parametros.sh
i=1
for parametro in "$@"
do
	echo "Parametro $i: $parametro"
	i=$((i+1))
done
	 
