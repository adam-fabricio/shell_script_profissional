#	Capítulo 9	-	Arquivo de Configuração

É um arquivo de texto que específica como será o funcionamento do programa. 
Ele pode conter:

	* Informações sobre o usupario
	* Definilçoes de prâmetros necessários para a execução do programa
	* Definições de limites máximo e minímo
	* Estado de chaves que lgam e desligam funcionalidades
	* Localização de arquivos externos
	* Definições de aparência do programa
	* Personalização de funcionamento

## Um arquivo de configuração é formado por:

Componente		|	Descrição
---------		| ------------
Palavra-chave	| Define qual característica do programa está em foco.
Valor			| Define qual será o comportamento dessa carcterística.
Separador		| Caractere que separa a palavra-chave do seu valor
Comentário		| Caracter que faz uma linha ser ignorada

	* Palavra Chave	- Formada apenas por letras e números
	* Valor			- Pode ser numérico, indicando quantidade, liga e desliga
					  ou um texto qualquer
	* Separador		- É necessário para que a palavra-chave e o valor não 
					  fiquem grudados. 
	* Comentário	- Útil para desativar temporariamente uma opção ou colocar
					  textos auto explicativos.

## Especificando um arquivo de configuração

	* As linhas de comntário iniciam por #, podendo ser precedido por brancos
	* A chave fica no início da linha, podendo ser precedida por brancos
	* O valor fica após a chave, separado por um ou mais brancos.
	* A chave pode ser composta por letras e números somente.
	* O valor pode ser qualquer texto (string) ou números, sem aspas.
	* Por branco entende-se espaços em brancos ou Tab.


## O Programa de parser deve conter

	* Definir varáveis com os valores padrão de cada opção
	* Ler linha a linha (loop) o arquivo de configuração
	* O valor fuca após a chave, separado por um ou mais branco
	* O valor pode ser qualquer texto (string) ou nímero sem aspas.
	* Por branco, entende-se: espaço em branco ou TAB.
	* Se encontrar linhas em branco ou comentário, ignorar
	* Processar as linhas com palabras-chave, definindo as variáveis do
	  programa com os valores encontrado
	* Configurações carregadas, basta processá-las e mostrara mensagem na tela

### Sintaxe:

\<brancos opcionais\> # comentário \<branco opcionais\>
\<brancos opcionais\> chave \<um ou mais brancos\> valor \<brancos opcionais\>

### Expressões regulares

^ \s* # .* \s* $
^ \s* [A-Za-z0-9]+ \s+ .* \s* $


## Característica de parser genérico

	O parser genérico, funcionando com qualquer combinação de chaves e valores,
pois cada programa terá chaves diferentes para serem configuradas.  Ele também
precisará acesar os arquivso onde quer que eles estejam, não necessáriamente no
mesmo diretório. E, por fim, ele precisará se comunicar com programa que o
chamar, recebendo o nome do arquivo a ser lido e epois entregando os
resultados.

Exemplos:
	* Parser, dê-me o valor da chave SomenteLeitura do arquivo permissoes.conf
	* Parser, dê-me todas as configurações que encontrar no global.conf

	Para que este esquema funcione, há alguma alternativasa considerar:

	1. O parser pode ser uma biblioteca, um conjunto de funções que devem ser 
	 incluidas na shell atual e conforme chamadas, retonam os valores 
	 requisitados.
		$ CONFIG=mensagem.conf
		$ source parser.sh
		$ echo $(PegaValor Mensagem)
		
	2. O aparser pode ser um programa, que deve ser incluído no shell atual e 
	 definirávarável de acordo com as configurações encontradas.
	 	$ CONFIG=mensagem.conf
		$ source parser.sh
		$ echo $MENSAGEM

	3. O parser pode ser um programa, que recebe um arquivo como parâmetro e 
	 retorna na saída padrão toda a configuração no formato *chave-valor* do
	 shell, pronto para ser usado com o comando eval.
	 	$ eval $(./parser.sh mensagem.conf)
		$ echo $MENSAGEM

### Parser Conversor

+--------------+ chave1 valor1  +---------+ chave1="valor1"  +------------+
|              | chave2 valor2  |         | chave2="valor2"  |            |
|   Arquivo    | chave3 valor3  |         | chave3="valor3"  |            |
|     de       |--------------->| Parsrer |----------------->| Aplicativo |
| Configuração |                |         |                  |            |
|              |                |         |                  |            |
+--------------+                +---------+                  +------------|

	$ ./parser.sh mensagem.conf
	USARCORES="ON"
	CORFUNDO="44"
	CORLETRA="37"
	MENSAGEM="Modo texto é legal"
	$

