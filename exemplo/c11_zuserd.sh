#!/bin/bash
#
#  zuserd.sh
#
#-----------------------------------------------------------------------------#
#  Lista, adiciona e remove usuários do sistema Z
#-----------------------------------------------------------------------------#
#  Requisitos: bantex.sh, dialog
#-----------------------------------------------------------------------------#
#	Histórico:
#	v0.1	-	18/10/2022	-	Adam
#		- Versão inicial do programa
#-----------------------------------------------------------------------------#
#  Localização do arquivo do banco de dados
BANCO=exemplo/c10_usuarios.sh

#  Inclui o gerenciador do banco de dados
source exemplo/c10_bantex.sh || {
	echo "Ops, ocorreu algum erro no gerenciador do banco"
	exit 1
}

acao=$( dialog --stdout \
	--menu "Aplicativo |user - Interface amigável" \
	0 0 0 \
	lista "Lista todos os usuários do sistema" \
	adiciona "Adiciona um usuário novo no sistema" \
	remove "Remove um usuário do sistema")


#  Lida com o comando recebido
case $acao in
	lista)
		#  Lista dos logins (apaga a primeira linha)
		temp=$(mktemp -t lixo)
		pega_campo 1 | sed 1d > "$temp"
		dialog --title "Usuários" -- textbox "$temp" 13 30 rm $temp 13 30
		rm $temp
		;;




































		,



#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#

