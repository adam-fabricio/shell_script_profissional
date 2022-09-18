#!/bin/sh
#  debug-categorizado.sh
#
# Exemplo de Debug categorizado em três níveis
DEBUG=${1:-0}		#  Passe o nível pelo $1
Debug(){
	[ $1 -le $DEBUG ] && echo "--- DEBUG $*" 
}

Debug 1 "Início do programa"
i=0
max=5
echo "Contando até $max"
Debug 2 "Vou entrar no while"
while [ $i -ne $max ]; do
	Debug 3 "Valor de \$i antes de incrementar: $i"
	#let i=$i+1			#  Funciona apenas no bash
	#i=$((i+1))			#  Funciona no bash e no sh
	i=$(expr $i + 1 )   #  Funciona no bash e no sh
	Debug 3 "Valor de \$i após incrementar: $i"
	echo "$i..."
done
Debug 2 "Sai do while"
echo 'Terminei'
Debug 1 "Fim do Programa"


