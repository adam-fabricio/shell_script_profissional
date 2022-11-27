#!/bin/bash

#users.sh

while read linha
do 
	usuario=$(echo "$linha" | cut -d: -f1 )
	nome=$(echo "$linha" | cut -d: -f5 )
	echo -e "$usuario\t$nome" 
done < "/etc/passwd"
echo
