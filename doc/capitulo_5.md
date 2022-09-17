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

	
