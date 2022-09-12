#!/bin/sh
#
###############################################################################
#
# Mostra logins e nomes de usuários do sistema
# Obs,: Lê dados do arquivo /etc/passwd
#
# Versão 1: Mostra usuários e nomes separados por TAB
# Versão 2: Adicionado suporte à opção i
# Versão 3: Adicionado à opção -V e opções invalidas
# Versão 4: Arrumado o bug quando não tem opções, basename no nome do programa
#			nome do programa, -V extraindo direto dos cabeçalhos, adicionadas
#			opções --help e --version
# Versão 5: Adicionadas opções -s e --sort
#
# Aurélio, Novembro 2007
#
###############################################################################

ordenar=0		# A saida deverá ser ordenada?

MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V]

	-h, --help \tMostra esta tela de ajuda e sai
	-s, --sort \tOrdena a listagem alfabeticamente
	-V, --version \tMostra a versão do programa e sai

"

# Tratamento das opções de linha de comando

case "$1" in 
	-s | --sort)
		ordenar=1
		;;

	-h | --help)
		echo "$MENSAGEM_USO"
		exit 0
		;;

	-V | --version)
		echo -n $(basename "$0")
		# Extrai a versão diretamente dos cabeçalhos do programai
		grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
		exit 0
		;;
		
	*)
		if test -n "$1"
		then
			echo Opção inválida: $1
			exit 1
		fi
		;;
esac

# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordenar a listagem (se necessário)
if test "$ordenar" = 1
then
	lista=$(echo "$lista" | sort)
fi

# Mostra o resultado para o usuário
echo "$lista" | tr : \\t

