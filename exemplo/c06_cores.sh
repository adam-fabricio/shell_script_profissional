#!/bin/bash
# cores.sh
# Mostra todas as combinações de cores do console


for letra in {0..7}; do							#  LINHAS: Cores da letras
	for brilho in '' ';1'; do					#  liga/desliga cor brilhante
		for fundo in {0..7}; do					#  COLUNAS: Cores dos fundos
			seq="4$fundo;3$letra"				#  compõe código de cores
			echo -e "\033[$seq${brilho}m\c"		#  liga a cor
			echo -e " $seq${brilho:- } \c"		#  mostra o código na tela
			echo -e "\033[m\c"					#  desliga cor
		done; echo								#  quebra a linha
	done
done

