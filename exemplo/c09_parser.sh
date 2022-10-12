#!/bin/bash
#
# c09_parser.sh
#
#-----------------------------------------------------------------------------#
#	Lê arquivos de configuração e converte os dados para variáveis do shell na
#	saída padrão
#-----------------------------------------------------------------------------#
#	Autor:
#		Adam Fabricio Silveira Silva
#-----------------------------------------------------------------------------#
#	Histórico:
#		v1.0	-	12/10/2022	-	Adam:
#			- Início do Programa
#-----------------------------------------------------------------------------#
#	Dicas:
#		Use $LINHA sem aspas para remover os brancos
#---------------------------------PRE EXECUÇÃO--------------------------------#
echo -e '\033c'
CONFIG=$1								# O aruqivo de existir e ser legivel
if [ -z "$CONFIG" ]; then
	echo Uso: parser arquivo.conf
	exit 1
elif [ ! -r "$CONFIG" ]; then
	echo Erro: Não consigo ler o arquivo $CONFIG
	exit 1
fi
#----------------------------------VARIAVEIS----------------------------------#
#-----------------------------------EXECUÇÃO----------------------------------#
#  Loop para ler linha a linha a configuração, guardando em $LINHA
while read LINHA; do
	#  Ignorando as linhas de comentário
	[ "$(echo $LINHA | cut -c1)" = '#' ] && continue
	#  Ignornado as linhas em branco
	[ "$LINHA" ] || continue
	#  Guardando cada palavra em $1, $2, $3, ...
	set - $LINHA

	#  Extraindo os dados (chaves sempre em maiúsculas)
	chave=$(echo $1 | tr a-z A-Z)
	shift
	valor=$*

	#  Mostrando chave="valor" na saida padrão
	echo "CONF_$chave=\"$valor\""
done < "$CONFIG"

#---------------------------------PÓS EXECUÇÃO--------------------------------#
echo
#-----------------------------------------------------------------------------#

