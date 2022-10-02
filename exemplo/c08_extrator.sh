#!/bin/bash
#
# c08_extrator.sh
#
#-----------------------------------------------------------------------------#
#------------------------------------Autor------------------------------------#
#
#	Autor: Adam
#
#----------------------------------Histórico----------------------------------#
#
#	v1.0	-	02/11/2022	-	Adam
#		- Retirando a linha com a palvra 
#	v1.1	-	02/11/2022	-	Adam
#		- Retirando o link através do cut
#	v2.0	-	02/11/2022	-	Adam
#		- Teste com do script 1 em outro arquivo
#	v2.1	-	02/11/2022	-	Adam
#		- Retirando o link atraves do cut
#	v3.0	-	02/11/2022	-	Adam
#		- Restruturado o código usando case
#		- Criado ajuda para o uso
#		- melhorando o filtro
#
#------------------------------------Teste------------------------------------#
#
#	bash 5.1.16
#
#--------------------------------PRE EXECUÇÃO---------------------------------#

echo -e '\033c'

#----------------------------------Variaveis----------------------------------#

linha="Nao passado a forma de filtro"
mensagem_de_ajuda="
Uso $(basename "$0") [opção 1] [opção 2] [opção 3]
	OPÇÕES:
		N/A:	Aparece a opção de ajuda
	OPÇÂO 1	- Escolha do arquivo que será utilizado para o filtro:
		1	c08_pagina1.html
		2	c08_pagina2.html
	Opção 2	- Escolha do filtro da linha
		1	fgrep Google arquivo
		2	fgrep '>Google<\\a> arquivo
	opção 3	- Retirada o link da linha
		1	cut -d \" -f 2
		2	sed 's/.*href='// ; s/'.*//'
"

#----------------------------------EXECUÇÃO-----------------------------------#

[ -z $1 ] && echo "$mensagem_de_ajuda"	&& exit 0


case "$1" in
	"1")	pagina="exemplo/c08_pagina1.html"	;;
	"2")	pagina="exemplo/c08_pagina2.html"	;;
esac

case "$2" in
	"1")	linha=$(fgrep Google "$pagina")			;;
	"2")	linha=$(fgrep '>Google<\a>' "$pagina")	;;
esac

case "$3" in
	"1")	linha=$(echo "$linha" | cut -d \" -f 2)					;;
	"2")	linha=$(echo "$linha" | sed 's/.*href="// ; s/".*//')	;;
esac

echo "$linha"


#--------------------------------PÓS EXECUÇÂO---------------------------------#

echo

#-----------------------------------------------------------------------------#

