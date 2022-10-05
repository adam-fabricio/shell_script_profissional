#!/bin/bash
#
#c08_manchetes.sh
#
#-----------------------------------------------------------------------------#
#	Autor:	
#		Adam
#
#-----------------------------------------------------------------------------#
#
#	Histórico:
#		V1.0	-	04/10/2022	-	Adam
#			- Extrai as manchetes do texto brlinux.txt
#
#-----------------------------------------------------------------------------#
#
#	Notas:
#		- Tecnica para solução do problema foi:
#			- substituir as quebras de página para ;
#			- substituir cada dois ;; para quebra de linha

#-----------------------------------------------------------------------------#
#
#	Teste:
#		bash 5.1.16
#
#---------------------------------PRE EXECUÇÃO--------------------------------#

echo -ne '\033c'

#----------------------------------VARIAVEIS----------------------------------#

manchete=$(cat .exercicio/c08_brlinux.txt)

#----------------------------------EXECUÇÃO-----------------------------------#

manchete=$( echo "$manchete" | tr "\n" ";"					)
manchete=$( echo "$manchete" | awk 'gsub(";;" , "\n"	)'	)
manchete=$( echo "$manchete" | tr ";" " "					)
manchete=$( echo "$manchete" | grep ^[A-Z]					)
manchete=$( echo "$manchete" | sed '1,/BR-Linux.org/ d'		)

#---------------------------------PÓS EXECUÇÃO--------------------------------#

echo "$manchete"
echo

#-----------------------------------------------------------------------------#
