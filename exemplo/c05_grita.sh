#!/bin/sh
#
# grita.sh
#
# Mostra uma palavra $(TXT) em maiúscula e com exclamações
# Exemplo: foo -> !!!!!FOO!!!!!

DEBUG=1									#  Depuração: 0 - Desliga, 1 - Liga

#  Função de depuração
Debug(){
	[ "$DEBUG" = 1 ] && echo "-----------{ $*"
}

TXT="gritaria"
TXT="     $TXT     "					#  Adiciona 5 espaços ao redor
Debug "TXT com espaços		:	[$TXT]"
TXT=$(echo "$TXT" | tr ' ' '!')			#  Troca o espaço por exclamações
Debug "TXT com exclamações	:	[$TXT]"
TXT=$(echo $TXT | tr a-z A-Z)			#  Deixa o texto em maiúscula
echo "$TXT"								#  Mostra a mensagem


