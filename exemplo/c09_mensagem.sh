#!/bin/bash
#
# c09_mensagem.sh
#
#-----------------------------------------------------------------------------#
# Mostra uma mensagem colorida na tela, lendo os dados de um arquivo de
# configuração.
#-----------------------------------------------------------------------------#
#	Autor:
#		Adam Fabricio Silveira Silva
#-----------------------------------------------------------------------------#
#	Notas:
#		A variavel ${COR_LETRA} foi colocada entre chaves para evitar confusão
#	com a letra "m" seguinte, que faz parte do caractere de controle ESC[m.
#	Sem as chaves o shell tentaia expandir a variável $COR_LETRAm, que não
#   Existe.
#		O comando diff pode ser redirecionado para o vim:
#			diff -u arquivo1 arquivo2 | vim -
#
#	Dica:
#		Basta referenciar o $Linha sem aspas para que todos os beancos do
#	início e fim da linha sejam removidos, e os espaços e TABs entre a chave
#	sejam convertidos para apenas um espaço normal.
#			teste: 
#				echo com aspas: "$LINHA"
#				echo sem apspas $LINHA
#
#-----------------------------------------------------------------------------#
#	Histórico:
#		V1.0	-	08/10/2022	-	Adam:
#			- Esqueleto do programa
#		v2.0	-	08/10/2022	-	Adam:
#			- Construindo o parser
#		v3.0	-	08/10/2022	-	Adam:
#			- Transformando a linha em variaveis posicionais
#		v4.0	-	08/10/2022	-	Adam:
#			- Finalizado o primeiro parser
#		v5.0	-	08/10/2022	-	Adam:
#			- Melhorisas no parser
#			- transformarndo o valor de todas as chaves para minusculo
#		v6.0	-	12/10/2022	-	Adam:
#			- substituindo o parser por outra configuração
#-------------------------------PRE EXECUÇÂO----------------------------------#
#CONFIG=$(dirname "$0")"/c09_mensagem_1.conf"	#  Arquivo de configuração
CONFIG=$(dirname "$0")"/c09_mensagem.conf"		#  Arquivo de configuração
#--------------------------------VARIAVEIS------------------------------------#
USAR_CORES=0										#  config: UsarCores
COR_LETA=											#  config: CorLetra
COR_FUNDO=											#  config: CorFundo
MENSAGEM='Mensagem padrão'							#  config: Mensagem
#----------------------------------PARSER-------------------------------------#
#  Loop para ler linha a linha a configuração, guardando em $LINHA
#  while read LINHA; do
#  	#  ":" -  Comando vazio, que não faz nadai
#  	## echo com aspas: "$LINHA"
#  	## echo sem aspas: $LINHA
#  	#  Ignorando as linhas de comentário
#  
#  	[ "$(echo $LINHA | cut -c1)" == "#" ] && continue
#  	#  Ignorando as linhas em branco
#  	[ "$LINHA" ] || continue
#  	#  Guardando cada palavra da linha em $1, $2, $3, ...
#  	#  "Suzy pe metaleira" fica $1=Suzy	$2=é	$3=metaleira
#  	set - $LINHA
#  	#  Extraindo os dados
#  	#  Primeiro vem a chave e o resto é o valor.
#  	#  Transformando o valor das chaves para minúsculas. 
#  	chave=$(echo $1 | tr A-Z a-z)
#  	shift
#  	valor=$*
#  	##   echo "+++ $chave --> $valor"
#  	#  Processando as configurações encontradas
#  	case "$chave" in
#  		usarcores)	[ $(echo $valor | tr A-Z a-z) = 'on' ] && USAR_CORES=1	;;
#  		corfundo)	COR_FUNDO=$(echo $valor | tr -d -c 0-9)					;;
#  		corletra)	COR_LETRA=$(echo $valor	| tr -d -c 0-9)					;;
#  		mensagem)	[ "$valor" ] && MENSAGEM=$valor							;;
#  		*)	echo "Erro no arquivo de configuração"	;	exit 1				;;
#  	esac
#  
#  done < "$CONFIG"


#----------------------CARREGANDO A CONFIGURAÇÃO DO ARQUIVO EXTERNO-----------#
eval $($(dirname "$0")/c09_parser.sh $CONFIG)

#--------------------------PROCESSANDO OS VALORES-----------------------------#
[ "$(echo $CONF_USARCORES | tr A-Z a-z)" = 'on' ] && USAR_CORES=1
COR_FUNDO=$(echo $CONF_CORFUNDO | tr -d -c 0-9)		#  Só números
COR_LETRA=$(echo $CONF_CORLETRA | tr -d -c 0-9)		#  Só números
[ "$CONF_MENSAGEM" ] && MENSAGEM=$CONF_MENSAGEM

#---------------------------------EXECUÇÃO------------------------------------#
if [ $USAR_CORES -eq 1 ]; then
	#  Mostrar mensagem colorida
	#  Exemplo: \03[40;32mOlá\033[m
	echo -e "\033[$COR_FUNDO;${COR_LETRA}m$MENSAGEM\033[m"
else
	#  Não usar cores
	echo "$MENSAGEM"
fi
#-----------------------------------------------------------------------------#
