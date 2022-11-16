#!/bin/bash
#
#  zuserd.sh
#
#-----------------------------------------------------------------------------#
#  Lista, adiciona e remove usuários do sistema Z
#-----------------------------------------------------------------------------#
#  Requisitos: bantex.sh, dialog
#-----------------------------------------------------------------------------#
#             zuser sem navegação                                             #
#                                                                             # 
#                          +-----------+                                      # 
#                     +--->| Listar    |---+                                  #
#                     |    +-----------+   |    +----------+                  #
#                     |                    |    |          |                  #
#     +-----------+   |    +-----------+   |    | Fim      |                  #
#     | Menu      |---+--->| Adicionar-|---+--->| do       |                  #
#     | principal |   |    +-----------+   |    | Programa |                  #
#     +-----------+   |                    |    |          |                  #
#                     |    +-----------+   |    +----------+                  #
#                     |--->| Remover   |---+                                  #
#                          +-----------+                                      #
#                                                                             #
#       Zuser Melhorado                                                       #
#                                                                             #
#                   +-----------+                                             #
#               +---| Listar    |<--+                                         #
#               |   +-----------+   |                                         #
#               |                   |                                         #
#               |         +---------+                                         #
#               |         |                                                   #
#               |   +-----------+          +-----------+                      #
#               +-->| Menu      |--------->| Adicionar |                      #
#               +-->| Principal |<---------|           |                      #
#               |   +-----------+          +-----------+                      #
#               |         |                                                   #
#               |         +---------+                                         #
#               |                   |                                         #
#               |   +-----------+   |                                         #
#               +-->| Remover   |<--+                                         #
#                   +-----------+                                             #
#                                                                             #
#                                                                             #
#-----------------------------------------------------------------------------#
#	Histórico:
#	v0.1	-	18/10/2022	-	Adam
#		- Versão inicial do programa
#	v1.0	-	07/11/2022	-	Adam
#		- Versão melhorada
#			- Tratamento do ESC e dos botões cancelar
#			- Aplicação agora roda em loop
#
#-----------------------------------------------------------------------------#

#  Localização do arquivo do banco de dados
BANCO="exemplo/c10_usuarios.txt"

#  Inclui o gerenciador do banco de dados
source exemplo/c10_bantex.sh || {
	echo "Ops, ocorreu algum erro no gerenciador do banco"
	exit 1
}
while :
do
	acao=$( dialog --stdout --menu "Aplicativo |user - Interface amigável"\
	   	0 0 0 \
		lista "Lista todos os usuários do sistema" \
		adiciona "Adiciona um usuário novo no sistema" \
		remove "Remove um usuário do sistema")
	[ $? -ne 0 ] && exit

	#  Lida com o comando recebido
	case $acao in
		lista)
			#  Lista dos logins (apaga a primeira linha)
			temp=$(mktemp -t lixo_XXX)
			pega_campo 1 | sed 1d > "$temp"
			dialog --title "Usuários" --textbox "$temp" 13 30
			rm $temp
			;;
		adiciona)
			login=$(dialog --stdout --inputbox "Digite o login:" 0 0)
			[ $? -ne 0 ] && continue
			[ "$login" ] || continue

			#  Primeiro confere se já não existe esse usuário
			tem_chave "$login" && {
				msg="O usuário '$login' já foi cadastrado."
				dialog --msgbox "$msg" 6 40
				continue
			}

			#  Ok usuário novo, prossigamos
			nome=$(dialog --stdout --inputbox "Nome completo:" 0 0)
			[ $? -ne 0 ] && continue
			idade=$(dialog --stdout --inputbox "Idade:" 0 0)
			[ $? -ne 0 ] && continue
			sexo=$(dialog --stdout --radiolist "sexo:" 0 0 3\
					Feminino "" on Masculino "" off)
			[ $? -ne 0 ] && continue
			sexo=$(echo $sexo| cut -c1)
			#  Dados obtidos agora hora de mascarar eventuais dois-pontos
			nome=$(echo $nome | mascara)
			#  Tudo pront, basta inserir
			msg=$(insere_registro "$login:$nome:$idade:$sexo")
			dialog --title "Resultado" --msgbox "$msg" 6 40
			;;
		remove)
			#  Obtém a lista de usuários
			usuarios=$(pega_campo 1,2 | sed 1d)
			usuarios=$(echo "$usuarios" | sed 's/:/ "/;s/$/"/')
			login=$(eval dialog --stdout --menu \"Escolha o usuário a remover\" \
				0 0 0 $usuarios)
			[ $? -ne 0 ] && continue
			msg=$(apaga_registro "$login")
			dialog --title "Resultado" --msgbox "$msg" 6 40
			;;
	esac
done




#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#

