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
# Versão 6: Adicionadas opções -r, --reverse, -u, --upercase, leitura de 
#			multiplas opções de (loop)
# Versão 7: Melhoria no código para que fique mais legivel, adicionadas opções
#			-d, --delimiter
# Versão 7g: Modificado para usar o getopts
#
###############################################################################
# Aurélio, Novembro 2007
#
###############################################################################

ordenar=0		# A saida deverá ser ordenada?
inverter=0		# A saída deverá ser invertida?
maiusculas=0	# A saída deverá ser em maiúscula?
delim='\t'		# Caractere usado como delimitador de saída
MENSAGEM_USO="
Uso: $(basename "$0") [OPÇÕES]
	
	OPÇÕES:
		-d C	Usa o caracter C como delimitador
		-r 		inverte a listagem
		-s 		Ordena a listagem algabeticamente

		-h 		Mostra esta tela de ajuda e sai
		-V		Mostra a versão
"

# Tratamento das opções de linha de comando

while getopts ":hVd:rsu" opcao
do
	case $opcao in
		# Opções que ligam/desligam chaves
		s)		ordenar=1	;;
		r)		inverter=1	;;
		u)		maiuscula=1	;;

		# Opções que usam parâmetros
		d)		delim="$OPTARG"	;;
		
		# Opções de informação do programa
		h)
			echo "$MENSAGEM_USO"
			exit 0
			;;
		V)
			echo -n $(basename "$0")
			# Extrai a versão diretamente dos cabeçalhos do programa.
			grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
			;;
			
		
		\?)
			echo Opção inválida: $OPTARG
			exit 1
			;;
				
		:)
			echo Faltou argumento para: $OPTARG
			exit 1
			;;
	esac
done

# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena, inverte e converte para maiúsculo (se necessário)

test "$ordenar"		= 1	&&	lista=$(echo "$lista" | sort)
test "$inverter"	= 1	&&	lista=$(echo "$lista" | tac)
test "$maiuscula"	= 1	&&	lista=$(echo "$lista" | tr a-z A-Z)

# Mostra o resultado para o usuário
echo "$lista" | tr : "$delim"

