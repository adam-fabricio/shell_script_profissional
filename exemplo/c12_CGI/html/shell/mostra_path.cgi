#!/bin/bash
# mostra_path.cgi

#  Vamos mostrar uma página HTML
echo Content-type: text/html
echo
#  Adiciona um path falso ao path
PATH=$PATH:/noel
#  Para cada diretório $PATH
IFS=:
for diretorio in $PATH; do
	#  Confirme se ele existe
	if test -d $diretorio; then
		extra="existe"
	else
		extra="não existe"
	fi
	#  E mostre o resultado na tela
	echo "$diretorio ($extra)"
done
