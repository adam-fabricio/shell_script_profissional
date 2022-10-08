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
#-----------------------------------------------------------------------------#
#	Histórico:
#		V1.0	-	08/10/2022	-	Adam:
#			- Esqueleto do programa
#			
#-------------------------------PRE EXECUÇÂO----------------------------------#
CONFIG=$(dirname "$0")"/c09_mensagem.conf"			#  Arquivo de configuração
#--------------------------------VARIAVEIS------------------------------------#
USAR_CORES=0										#  config: UsarCores
COR_LETA=											#  config: CorLetra
COR_FUNDO=											#  config: CorFundo
MENSAGEM='Mensagem padrão'							#  config: Mensagem
#----------------------------------PARSER-------------------------------------#
#  Loop para ler linha a linha a configuração, guardando em $LINHA
while read LINHA; do
	#  Comando vazio, que não faz nada
	:
done < "$CONFIG"
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
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
