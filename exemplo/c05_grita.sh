#!/bin/sh
#
# grita.sh
#
# Mostra uma palavra $(TXT) em maiúscula e com exclamações
# Exemplo: foo-> !!!!!FOO!!!!!

TXT="gritaria"
TXT="     $TXT     "
echo "TXT com espaços		:	[$TXT]"
TXT=$(echo $TXT | tr '' '!')	#  Adiciona 5 espaços ao redor
echo "TXT com exclamações	:	[$TXT]"
TXT=$(echo $TXT | tr a-z A-Z)	#  Troca espaço por exclamações
echo "$TXT"

