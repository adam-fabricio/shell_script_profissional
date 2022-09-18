# C05 - Depuração (debug)

## Verificação de Sintaxe (-n)
	Ao encontrar algum problema, antes de começar todo o processo de depuração,
verificar primeiro se está tudo certo com a sintaxe.
	Para realizar essa verificação usar
	```
	bash -n grita.sh
	sh -n grita.sh
	```

## Debug simples (echo)
	Essa técnica consiste em colocar comandos adicionais para mostrar o 
conteúdo de varáveis importante no trecho de código problematico.

## Debug global (-x, -v)
	A opção -x, o shell mostra na tela os comandos conforme eles são 
executados, após feitas todas as expansões internas de nomes de arquivo e 
variáveis. Estas linhas são precedidas pelo sinal de "+" ou pelo caracter
armazenado na váriavel de ambiente $PS4. Dois sinais de ++ quer dizer que
o comando foi executado em uma subshell

```
Quando não colocamos aspas " na variável o bash faz uma limpa no conteúdo.
e a variável só é expandida se colocada em aspas duplas " e não simples '.

```

A opção -v, o shell mostra na tela os comandos original, antes da execução.

## Debug setorizado (liga/desliga)
	Serve para setorizar onde o debug vai funcionar, não deixando ele 
rodando no código inteiro.
	Para ligar o debug  de comando basta usar ```set -x``` 
e para desligar ```set +x```.
	Para ligar o debug de linha tem que usar ```set -v```
e para desligar ```set +v```. 

## Execução passo a passo
	É um recurso para realizar a execução passo a passo, onde é esperado um 
comando do usário. Para iniciar o modo debug é necessário colocar o comnado
```
trap read DEBUG
```
é aconselhavel, iniciar o modo de depuração estar ligado para que as mensagens 
sejam mostradas na tela.
```
trap "" DEBUG
```
Não é necessário desativar o modo de depuração.

* Esta técnica funciona apenas no bourne shell

## Debug personalizado
	Este método consistem em criar uma função para realizar o DEBUG
```
Debug(){
	[ "$DEBUG" = 1 ] && echo "$*"
}
``` 
	É uma evolução do debug simples com echo, agora a mensagem apenas irá 
aparecer quando a variável global $DEBUG for 1.

## Debug categoraizado
	A idéia é categorizar as mensagens de Debug devido sua criticidade.
	Quanto maior o número maior é o detalhamento do Debug. Exemplo:
	- Mensagem nível 1: "Vou iníciar o calculo do total"
	- Mensagem nível 4: Trariam detalhes de cada variavel.
	Os niveis são definidos pelo programador, exemplo de níveis.
	- Nível 1: Mensagens genéricas, de localização ("estou aqui")
	- Nível 2: Mensagens de localização de fluxo ("Entrei no loop")
	- Nível 3: Mensagens com conteúdo de variaveis importantes.
	- Nivel 4: Mensagens com conteúdo de variáveis secundárias.
	
	A função Debug() agora pode ser:
```
Debug(){
	[ $1 -le $DEBUG ] && echo "--- DEBUG $*"
}
```

Posssibilidades de implementação na função de Debug:
	- Gravar mensagens em um arquivo para ser analisado posteriormente
	- Usar uma cor diferente para cada nível (muito util)
	- Mudar o alinhamento da mensagem, deslocando o texto mais a direita quando
	  quanto maior for seu nível 
	- Fazer um pré processamento que verifica outras condições, além do valor 
	  $DEBUG para decidir se mostra a mensagem ou não.

Esqueleto da função de DEBUG.

```
Debug(){
	[ $1 -le $DEBUG ] || return
	local prefixo
	case "$1" in
		1)	prefixo="-- "	;;
		2)  prefixo="---"	;;
		3)	prefixo="----"	;;
		*)	echo "Mensagem não categorizada: $*"; return;;
	esac
	shift
	echo $prefixo$*
}
}
