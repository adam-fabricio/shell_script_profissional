#!/bin/sh
###############################################################################
# getopts-teste.sh
# 
# Aurélio, Novembro de 2007
# 
# Loop que processa todas as opções da linha de comando.
# Atenção ao formato das opções válidas ":sa:"
# - Os dois-pontos do início ligam o modo silencioso
# - As opções válidas sçai "sa:", que são -s e -a
# - O dois pontos de 'a:' repesentam um argumento: -a F00
#
###############################################################################
while getopts "sa:" opcao
do
	# $opcao guarda a opção da vez (ou ? e : em caso de erro)
	# $OPTARG guarda o argumento da opção (se houver)
	#
	case $opcao in
		 s) echo "OK Opção simples (-s)";;
		 a) echo "OK Opção com argumento (-a), recebeu $OPTARG";;
		\?) echo "ERRO opção inválida: $OPTARG";;
		:) echo "ERRO Faltou argumento para $OPTARG";;
	esac
done

###############################################################################
<<comment
O loop termina quando nenhuma opção for encontrada.
Mas ainda podem existir argumentos, como um nome de arquivo.
A variável $OPTIND guarda o índice do resto da linha de comando, útil para
arrancar as opções já processadas
comment
###############################################################################
echo
shift $((OPTIND -1))
echo "INDICE: $OPTIND"
echo "RESTO: $*"
echo

