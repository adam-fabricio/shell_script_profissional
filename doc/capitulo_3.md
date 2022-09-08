## Capitulo 3 - Chaves (Flags)

	- É utilizada para ligar ou desligar funcionalidade em programas.
	- Pode ser utilizada como maneira rápida de o usuário ter acesso a
		configurações basicas.
	- O programa pode ter várias chaves
	- O estado inicial da chave pode ser mudado por:
		- testes internos
		- estado atual do sistema
		- horário de execução
		- resultado de cálculos
		- configurações do usuário
		- opções passadas pela linha de comando
	- Sempre colocar no ínicio do programa, com um estado inicial definido
	- Não usar outras variáveis do programa como chaves
	- Algumas chaves pode mudar o estado de outras chaves
	- Use nomes bem descritivos para chaves.
	- A língua inglesa tende a ser mais concisa para nomes de chaves
	- Pode ser usado prefixo padrão para nomes de chaves: `F_XXX`
	
 
	
### Exemplo de chave

	* Definição da chave
		```
		USAR_CORES=1	# Chave para usar cores(0 desliga, 1 liga)
		```
	* Teste que pode afetar o valor da chave
		```
			# O terminal VT100 não sabe nada de cores
			if test "$TERM" = "vt100"
				then
					USAR_CORES=0
			fi
		```
	* Utilização da chave
		```
		if test $USAR_CORES -eq 1
		then
			msg_colorida $mensagem		# chama a finção "msg_colorida"
		else
			echo $mensagem				# usa o echo normal
		```

## Dicas

	- Faça chaves com nomes bem descritivos.
	- Coloque no ínicio do programa
	- Separe visualmente do restante do programa
### Exemplo

```
###############################################################################
#
### Configuração do programa mostra_mensagem.sh
### Use 0 (zero) para desligar as opções e 1(um) para ligar
### O padrão é zero para todas (desligado)
#
USAR_CORES=0		# mostra cores nas mensagens?
CENTRALIZADO=0		# centralizar a mensagem na tela?
SOAR_BIPE=0			# soar um bipe ao mostrar a mensagem?
COMFIRMAR=0			# pedir confirmação antes de mostrar?
MOSTRAR_E_SAI=0		# sair do programa após mostrar?
#
### Fim da configuração - Não edite daqui para baixo
#
###############################################################################
```

