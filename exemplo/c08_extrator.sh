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
#	v3.1	-	02/11/2022	-	Adam
#		- Adicionado filtro para ignorar maiusculo e minusculo
#	v3.2	-	02/11/2022	-	Adam
#		- adicionado filtros e retirados lixos como aspas
#
#------------------------------------Notas------------------------------------#
#
#	Comando "sed"
#		sed 's/regex/substituto/ ; s/regex/substituto' arquivo 
#			 |
#			 -> Função "s" subistituir
#
#	Ferramenta tidy -> serve para arrumar arquivo html xml
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
		3	c08_pagina3.html
		4	c08_pagina4.html
	Opção 2	- Escolha do filtro da linha
		1	fgrep Google arquivo
		2	fgrep '>Google<\\a> arquivo
		3	fgrep -i (para não diferenciar maiusculo de minusculo)
		4	fgrep -i substitui maiusculas por minusculas.
		5	retirado aspas também
		6	substitui a quebra de linha por espaço
	opção 3	- Retirada o link da linha
		1	cut -d \" -f 2
		2	sed 's/.*href='//
		3	sed 's/.*href='// ; s/'.*//'
		4	sed 's/.*href=// ; s/>.*//'
		5	a cada fechamento de tag quebra a linha
"

#----------------------------------EXECUÇÃO-----------------------------------#

[ -z $1 ] && echo "$mensagem_de_ajuda"	&& exit 0


case "$1" in
	"1")	pagina="exemplo/c08_pagina1.html"		;;
	"2")	pagina="exemplo/c08_pagina2.html"		;;
	"3")	pagina="exemplo/c08_pagina3.html"		;;
	"4")	pagina="exemplo/c08_pagina4.html"		;;
	*  )	echo "parâmetro incorreto"; exit 1		;;
esac

case "$2" in
	"1")	linha=$(fgrep Google "$pagina"							)	;;
	"2")	linha=$(fgrep 	 '>Google</a>' "$pagina"				)	;;
	"3")	linha=$(fgrep -i '>Google</a>' "$pagina"				)	;;
	"4")	linha=$(fgrep -i '>google</a>' "$pagina" | tr A-Z a-z	)	;;
	"5")
		linha=$(fgrep -i '>google</a>' "$pagina" | tr A-Z a-z		)
		linha=$(echo "$linha" | tr -d \"							)
																		;;
	"6")	linha=$(tr '\n' ' ' < $pagina							)	;;
esac

case "$3" in
	"1")	linha=$(echo "$linha" | cut -d \" -f 2					)	;;
	"2")	linha=$(echo "$linha" | sed 's/.*href="//'				)	;;
	"3")	linha=$(echo "$linha" | sed 's/.*href="// ; s/".*//'	)	;;
	"4")	linha=$(echo "$linha" | sed 's/.*href=// ; s/>.*//'		)	;;
	"5")	linha=$(echo "$linha" | awk 'gsub("<[^/]", "\n&")'		)	;;
esac

[ "$4" = "1" ] && linha=$(echo "$linha" | fgrep -i ">google</a>"  			)
[ "$5" = "1" ] && linha=$(echo "$linha" | tr A-Z a-z | tr -d \"				)
[ "$6" = "1" ] && linha=$(echo "$linha" | sed 's/.*href=// ; s/>.*//'	)

echo "$linha"


#--------------------------------PÓS EXECUÇÂO---------------------------------#

echo

#-----------------------------------------------------------------------------#

