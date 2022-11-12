#!/bin/bash
#
#	tia.sh - o script da tia que precisa usar o computador
#
#-----------------------------------------------------------------------------#
#	Exemplo de como amarra o script em um menu principal usando o "while" o
#	'case' é usado para identificar qual foi a ação escolhida. Após cada ação,
#	ele sempre retorna ao menu principal. Só sai do script caso escolha a
#	última opção, aperte CANCELAR ou ESC.
#
#	Útil para usar como login shell de pessoas inexperientes ou fazer
#	utilitários de ações restritas e definidas.
#
#	Fluxograma:
#					INÌCIO						FIM
#                +-----------+				+----------+
#       +------->|   menu    |----ESC------>| sai do   |
#       |        | principal |--CANCEL----->| programa |
#       |        +----ok-----+         +--->+----------+ 
#       |             |                |
#       +<---1 2 3 4--+---ZERO-------->|
#
#-----------------------------------------------------------------------------#

#	Loop que mostra o menu principal
while :
do
	# Mostra o menu na tela, com as ações disponíveis
	resposta=$(
	dialog	--stdout											\
		 	--title 'Menu da Tia'								\
			--menu  'Oi Tia, escolha o que você quer fazer:'	\
			0 0 0												\
			1 'Navegar na Internet'								\
			2 'Escrever uma carta' 								\
			3 'Jogar paciencia'									\
			4 'Perder tempo'									\
			0 'Sair'											)

	#  Ela apertou CANCELAR ou ESC, então vamos sair...
	[ $? -ne 0 ] && break
	#  De acordo com a opção escolhida, dispara programas
	case "$resposta" in 
		1) firefox 'http://google.com.br'	;;
		2) nano /tmp/carta.txt				;;
		3) /usr/games/solitaire				;;
		4) xsnow xeye						;;
		0) break							;;
	esac
done
echo 'Tchau Tia!'	#  Mensagem final :)
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
