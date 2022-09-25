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
#		- Uso de lista []
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
[ "$1" = "1" ] && echo "$( grep root /etc/passwd	)"	#  todas linhas root
[ "$1" = "2" ] && echo "$( grep ^root /etc/passwd	)"	#  apenas iniciadas
[ "$1" = "3" ] && echo "$( grep bash$ /etc/passwd	)"	#  finalizadas
