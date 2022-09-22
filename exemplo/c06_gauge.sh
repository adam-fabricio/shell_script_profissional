#!/bin/bash
# gauge.sh
# Barra de progresso usando caracteres de controle
#
#	[..................................................]	  0%
#	[#########################.........................]     50%
#	[##################################################]	100%
#
# barra vazia

echo -n '[..................................................]    0%'
passo='12345'
for i in {10..100..10}; do			
	sleep 1							 
	posicao=$((i/2-4))				#  Calcula a posicão atual da barra
	echo -ne '\033[G'				#  vai para o começo da linha
	echo -ne "\033[${posicao}C"		#  vai para a posição atual da barra
	echo -n  "$passo"				#  preenche mais um passo
	echo -ne  '\033[56G'			#  vai para a posição da porcentagem
	echo -ne "$i"					#  mostra a porcentagem
done
echo
