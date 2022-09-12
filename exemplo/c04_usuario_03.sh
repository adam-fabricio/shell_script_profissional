#!/bin/bash
#
# Mostra logins e nomes de usuários do sistema
# Obs,: Lê dados do arquivo /etc/passwd
#
# Versão 1: Mostra usuários e nomes separados por TAB
# Versão 2: Adicionado suporte à opção i
# Versão 3: Adicionado à opção -V e opções invalidas
#
# Aurélio, Novembro 2007
#
###############################################################################

MENSAGEM_USO="
Uso: $0 [-h | -V]

	-h	Mostra esta tela de ajuda e sai
	-V	Mostra a versão do programa e sai

"

# Tratamento das opções de linha de comando

case "$1" in 

	-h)
		echo "$MENSAGEM_USO"
		exit 0
		;;

	-V)
		echo $0 Versão 3
		exit 0
		;;
	*)
		echo Opção inválida: $1
		exit 1
		;;
esac


# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t


