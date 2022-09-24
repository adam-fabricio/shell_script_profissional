#  Caracteres de controle

##  Código das cores da sequência ESC[...m ou \033[c1;c2m
>p1 -> código 1
>p2 -> código 2

Código	|	Descrição
-------	| -----------
0		|	Texto normal, sem cores
1		|	Cor 
5		|	pisca-pisca
7		|	Video reverso (inverte fundo com texto)
30		|	texto preto/cinza
31		|	texto vermelho
32		|	texto verde
33		|	texto marrom/amarelo
34		|	texto azul
35		|	texto roxo
36		|	texto ciano
37		|	texto cinza
40		|	fundo preto/cinza
41		|	fundo vermelho
42		|	fundo verde
43		|	fundo marrom/amarelo
44		|	fundo azul
45		|	fundo roxo
46		|	fundo ciano
47		|	fundo cinza

##  Posicionando o cursor

> ESC[<quantidade><Codigo>
> * ESC 		-> \033
> * <quantidade>	-> n | n,m -> padrão n=1, m=1


###  Comando de movimentação do cursor

Código	|	Ação
-------	| --------
nA		| Move o cursor n linhas para cima, na mesma coluna.
nB		| Move o cursor n linhas para baixo, na mesma coluna.
nC		| Move o cursor n colunas para direita, na mesma linha.
nD		| Move o cursor n colunas para esquerda, na mesma linha.
nE		| Move o cursor n linhas para baixo, na coluna 1.
nF		| Move o cursor n linhas para cima, na coluna 1.
nG		| Move o cursor para coluna N da linha atual
n,mH	| Move o cursor para a coluna m da linha n

###  Comandos de som [normalmente depreciado]

ESC[10;n -> Define a frequência para n padrão 750hz
ESC[11,n -> Define o tempo para n milisegundos (o padrão é 100)

###  Comandos de movimentação de tela e edição
Código	|	Ação
-------	| ------------
ESC[0]	| Apaga até o fim da tela.
ESC[1]	| Apaga até o começo da tela.
ESC[2]	| Apaga a tela toda.	
ESC[OK	| Apaga até o fim da linha.
ESC[1K	| Apaga até o começo da linha
ESC[2K	| Apaga a linha toda
ESC[nM	| Apaga n linhas para baixo
ESC[nP	| Apaga n linhas para baixo
ESC[nX	| Apaga n caracteres a direita(coloca espaço)
ESC[n@	| Apaga n espaços em branco
ESC[nL	| Insere n linhas em branco
ESC[nS	| Move a tela n linhas para cima
ESC[nT	| Move a tela n linhas para baixo
