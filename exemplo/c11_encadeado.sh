#!/bin/bash
#
#	c11_encadaedo.sh - O script que chega até o final.
#
#-----------------------------------------------------------------------------#
#
#----------------------------------DESCRIÇÃO----------------------------------#
#
# Exemplo de como encadear telas usando o operando  && (AND). Caso o usuário
# desista em qualquer tela (apertando o CANCELAR ou ESC), o script executa o
# primeiro comando após a cadeia de &&.
#
# Útil para fazer programas ou brincadeiras onde só há um caminho certo a
# seguir para chegar ao final.
#
# FLUXOGRAMA
#
#           INÍCIO                                                            
#          +-------+                                                          
#          | tela1 |--Cancel/ESC------->+                                    
#          +--ok---+                    |                                     
#          | tela2 |--Cancel/ESC------->+    +----------+                     
#          +-------+                    |--->| desistiu |                     
#          | tela3 |--Cancel/ESC------->+    +----------+                     
#          +-------+                    |                                     
#          | tela4 |--Cancel/ESC------->+                                     
#          +-------+                                                          
#          | final |                                                          
#          +-------+                                                          
#            FIM                                                              
#                                                                             
#---------------------------------EXECUÇÃO------------------------------------#
#  Função rápida para chamar a caixa YesNo
simnao(){
	dialog --yesno "$*" 0 0
}
#  Aqui começa o encadeamento de telas com o &&.
#  Somente apertando o botão OK vai para próxima tela. 
#  Há um 'exit' no final, que sai do script caso o usuário tenha chegado até
#  ofim da cadeia.

simnao 'Quer continuar?'						&&
simnao 'Estamos na segunda tela. Continua?'		&&
simnao 'Terceira. Continua continuando?'		&&
simnao 'Penúltima tela! E agora, continua?'		&&
echo 'Você chegou até o final!'					&& exit
#  Este trecho já não faz mais parte do encadeamento e só será alcançado caso o
#  usuário tenha apertado CANCELAR/ESC
echo Você desistiu antes de chegar no final...


