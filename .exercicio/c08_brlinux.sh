#!/bin/bash
# c08_brlinux.sh
# 
#-----------------------------------------------------------------------------#
#	Autor:
#		Adam
#
#-----------------------------------------------------------------------------#
#
#	Histórico:
#		v1.0	-	05/10/2022	-	Adam
#			- Extrai os titulos do site http://br-linux.org (index)
#
#
#-----------------------------------------------------------------------------#
#
#	Notas:
#
#-----------------------------------------------------------------------------#
#	Teste:
#		bash 5.1.16
#
#-----------------------------------VARIAVEIS---------------------------------#

manchetes=$(lynx -source http://br-linux.org)
#manchetes=$(cat .exercicio/brlinux.html	)

#---------------------------------PRE EXECUÇÃO--------------------------------#

echo -ne '\033c'

#-----------------------------------EXECUÇÃO----------------------------------#

manchetes=$( echo "$manchetes" | grep "<h2><a"	)
manchetes=$( echo "$manchetes" | sed 's/[^a-z]*<[^>]*>//g'	)

#---------------------------------POS EXECUÇÃO--------------------------------#
echo "$manchetes"
echo
#-----------------------------------------------------------------------------#










