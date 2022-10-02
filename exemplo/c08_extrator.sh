#!/bin/bash
#
# c08_extrator.sh
#
#-----------------------------------------------------------------------------#
#------------------------------------Autor------------------------------------#
#
#	Autor: Adam
#
#----------------------------------Histórico----------------------------------#
#
#	v1.0	-	02/11/2022	-	Adam
#		- Retirando a linha com a palvra 
#	v1.1	-	02/11/2022	-	Adam
#		- Retirando o link através do cut
#	v2.0	-	02/11/2022	-	Adam
#		- Teste com do script 1 em outro arquivo
#	v2.1	-	02/11/2022	-	Adam
#		- Retirando o link atraves do cut
#
#
#------------------------------------Teste------------------------------------#
#
#	bash 5.1.16
#
#--------------------------------PRE EXECUÇÃO---------------------------------#

echo -e '\033c'

#----------------------------------Variaveis----------------------------------#
#----------------------------------EXECUÇÃO-----------------------------------#

[ -z $1 ] && echo "Favor inseir parâmetros"

while test -n "$1"; do
	case "$1" in
		"1")
			pagina="exemplo/c08_pagina1.html"
			linha=$(fgrep Google "$pagina")
			[ "$2" = "1" ] && linha=$(echo "$linha" | cut -d \" -f 2) && shift
			echo "$linha"
			;;
		"2")
			pagina="exemplo/c08_pagina2.html"
			linha=$(fgrep Google "$pagina")
			[ "$2" = "1" ] && linha=$(echo "$linha" | cut -d \" -f 2) && shift
			echo "$linha"
			;;
	esac
	shift
done



#--------------------------------PÓS EXECUÇÂO---------------------------------#

echo

#-----------------------------------------------------------------------------#

