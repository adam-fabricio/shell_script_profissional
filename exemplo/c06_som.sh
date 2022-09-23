#!/bin/bash
# som.sh
# Demonstração de mudança da frequência do speaker
# Dica: Digite Ctrl+C para finalizar
#
# Restaura o bipe padrão (f=750, t=100ms)
echo -e '\033[10;750]\033[11;100]'
freq=0							#  Frequência inicial
while : ; do					#  loop infinito
	freq=$((freq+1))			#  aumenta frequência
	echo -e "\033[10;$freq]"	#  muda frequência no speaker
	echo	"frequência=$freq"	#  mostra frequência atual
	echo -e '\a'				#  emite o bipe
	sleep 0.100					#  espera 100 us
done
