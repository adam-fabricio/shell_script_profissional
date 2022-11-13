#!/bin/bash
#
#  navegando.sh - O script que vai e volta.
#
#--------------------------------DESCRIÇÃO------------------------------------#
#
#  Exemplo de como ligar todas as telas do programa entre si. Guardando
#  informações de ida e volta. o botão CANCELAR faz volta para a tela anterior
#  e o ok faz ir a próxima. Para sair do programa a qualquer momento basta
#  apertar o ESC.
#
#  Útil para fazer o programas interativo, de contexto, ou que se pode voltar
#  para corrigir informações.
#
#  FLUXOGRAMA
#                                                                             
#                      INICIO                                                        
#                  +------------+                                             
#                  |  primeiro  |--ESC----->+                                 
#      .---------->+-----OK-----+           |                                 
#      `-CANCEL----|    nome    |--ESC----->+    +----------+                 
#      .---------->+-----OK-----+           |    |          |                 
#      `-CANCEL----|   idade    |--ESC----->+--->| Sai do   |                 
#      .---------->+-----OK-----+           |    | Programa |                 
#      .-CANCEL----| est. civil |--ESC----->+    +----------+                 
#      .---------->+-----OK-----+           |                                 
#      `-CANCEL----|   gostos   |--ESC----->+                                 
#                  +-----OK-----+                                             
#                  |   final    |                                             
#                  +------------+                                             
#                       FIM                                                   
#                                                                             
#-----------------------------------------------------------------------------#
proxima='primeira'
#  loop principal
while :
do
	#  Aqui é identificada qual tela deve ser mostrada.
	#  Em cada cela são definidas as varáveis 'anterior' e a proxima # que
	#  definem os rumos da navegação.
	case "$proxima" in
		primeira)
			proxima='nome'
			dialog --backtitle 'Pegador de Dados'					\
				   --msgbox 'Bem-vindo ao pegador de dados!' 0 0
			;;
		nome)
			anterior='primeira'
			proxima='idade'
			nome=$(
					dialog --stdout									\
						   --backtitle 'Pegador de Dados'           \
						   --inputbox 'Seu nome:' 0 0)
			;;
		idade)
			anterior='nome'
			proxima='casado'
			idade=$(
					dialog  --stdout								\
						    --backtitle 'Pegador de Dados'			\
							--menu 'Qual a sua idade?' 0 0 0		\
							'menos de 15 anos'		''				\
							'entre 15 e 20 anos'	''				\
							'entre 25 e 40 anos'	''				\
							'mais de 40 anos'		'' )
			;;
		casado)
			anterior='idade'
			proxima='gostos'
			casado=$(
					 dialog --stdout										\
						    --backtitle 'Pegador de Dados'					\
							--radiolist 'Estado civil:' 0 0 0				\
										'solteiro'	'livre leve solto'	ON	\
										'noivo'		'quase amarrado'	OFF	\
										'casado'	'ja era'			OFF	\
										'viúvo'		'livre denovo'		OFF	)
			;;
		gostos)
			anterior='casado'
			proxima='final'
			gostos=$(
					 dialog --stdout										\
					        --separate-output								\
							--backtitle	'Pegador de Dados'					\
							--checklist	'Do que você gosta?' 0 0 0			\
										'jogar futebol'				''	off	\
										'pescar'					''	off	\
										'ir ao shopping'			''	off \
										'andar de bicicleta'		''	off	\
										'ficar na internet'			''	off	\
										'dormir'					''	off	)
			;;
		final)
			dialog															\
				--cr-wrap 													\
				--sleep 5													\
				--backtitle 'Pegador de Dados'								\
				--title 'Obrigado por responder'							\
				--infobox "
			Os dados informados foram
			Nome: $nome
			Idade: $idade
			Casado: $casado
			Gostos: \n$gostos
			" 14 40
			break
			;;
		*)
			echo "Janela desconhecida '$proxima'."
			echo "Abortando programa..."
			exit
	esac
	#  Aqui é feito o tratamento genérico de código de retorno de todas as
	#  telasas telas. Volta para a tela anterior se for CANCELAR, sai do
	#  programa se for ESC.
	retorno=$?
	[ $retorno -eq 1	] && proxima="$anterior"		#  Cancelar
	[ $retorno -eq 255	] && break						#  Exit
done

