#!/bin/bash
#
# c06_regex.sh	-	Experimenta formas de utilizar o Regex
#-----------------------------------------------------------------------------#
#
#  Autor:			Adam Fabricio SIlveira SIlva
#
#------------------------Historico--------------------------------------------#
#
#	V1.0	- 25/10/2022,	Adam:
#		- Uso normal do grep
#	v2.0	- 25/10/2022, 	Adam:
#		- Uso do circunflexo "^"
#	V3.0	- 25/10/2022,	Adam:
#		- Uso do Cifrão "$"
#	v4.0	- 25/10/2022,	Adam:
#		- Filtro por linhas vazias
#	V5.0	- 27/10/2022,	Adam
#		- Uso de lista []
#	v6.0	- 27/10/2022,	Adam:
#		- Uso de lista negada[^]
#	v7.0	- 28/10.2022,	Adam:
#		- Uso do ponto "."
#
#------------------------Teste------------------------------------------------#
# bash 5.1.16
#
#
#------------------------Variavveis-------------------------------------------#
# 
#------------------------Execução---------------------------------------------#

echo -e "\033c"

[ -z $1 ] && echo "Favor inserir parâmetro"
[ "$1" = "1" ] && echo "$( grep root /etc/passwd	 	)"	
[ "$1" = "2" ] && echo "$( grep ^root /etc/passwd	 	)"	
[ "$1" = "3" ] && echo "$( grep bash$ /etc/passwd	 	)"	
[ "$1" = "4" ] && echo "$( grep '^$' /etc/passwd	 	)"	
[ "$1" = "5" ] && echo "$( grep 'd-[nr]' /etc/passwd 	)" 
[ "$1" = "6" ] && echo "$( grep 'd-[^nr]' /etc/passwd	)"	
[ "$1" = "7" ] && echo "$( grep '^.[aeiou]' /etc/passwd	)" 
