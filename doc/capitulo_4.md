# Capítulo 4 - Opção de linha de comando (-f, --foo)

## Opções Específicas
###Quando colocar um adicionar funcionalidade
- A opção --F00 vai trazer benefícios a maioria dos usuáriosi?
- A opção --F00 vai trazer muita complexidade ao código atual?
- A opção --F00 vai influir no funcionamento da opção --BAR?
- A opção --F00 é auto-explicavel?
- A opção --F00 é realmente necessária? 
	- Não é possível fazer a mesma tarefa com combinanção de outras funções?
	- Não seria ela apenas "cosmética"?
## Prós e Contras.
### getopts
	- Funciona somente no bash (acredito que o sh funcione tb)
	- Somente opções curtas (-h)
	- Opções curtas juntas ou separadas (-abc e -a -b -c)
	- Verificação automática de argumento nulo
	- As opções válidas devem ser registradas em dois lugares
	- Loops nas opções é feito automaticamente
### "na mão"
	- Funciona em qualquer shell
	- Opções curtas e longas(-h, --help)
	- Verificação de argumentos para opções é feita manualmente
	- As Opções válidas devem ser registradas em dois lugares
	- Loop nas opções é feito manualmente com o shift

Se você já tem um programa e quer uncluir rapidamente o suporte a algumas
Opções de linha de comando, comece com o getopts e opções curtas que é a
solução mais rápida. Depois se você julgar importante incluir também as opções
longas, mude para solução caseira.

##Usando getopts
	- Colocar o getopts na chamada de um while, para que ele funcione em loop
	- O primeiro argumento para getopts é uma string que lista todas as opções
	  válidas para o programa.
		- Se o primeiro caractere desta string for dois-pontos ":", o getopts
		  funcionará em modo silencioso. Neste modo, as mensagens de erro não
		  são mostradas na tela. Isso é muito útil para nós, pois elas são em
		  inglês. Outra bantagem deste modo é no tratamento de erros,
		  possibilitando diferenciar quando é uma opção inválida e quando falta
		  um argumento. Use sempre este modo silencioso
		- Liste as letras todas grudadas, sem espaçõs em branco. Lembre-se que
		  o getopts só entende opções curtas, de uma letra. Por exemplo, "hVs"
		  para permitir as opções -h, -V e -s
		- Se uma opção requer argumento coloque dois-pontos logo após. Ex.:
		  hVd:sru
	- O segundo armento do getopts é o nome da varável na qual ele irá guardar
	  o nome da opção atual, útil para usar no case. Aqui você pode usar o nome
	  que preferir
	- Dentro do case, liste todas as opções válidas. Note que não pe necessário
	  o hífen! Se a opção requer um argumento, ele estará guardado na variável
	  $OPTARG. Trate també, as duas alternativas especiais que o getopts usa 
	  em caso de erro
	  - Uma interrogação é utilizada quando o usuário digita uma opção inválida
	    A opção digitada estará dentro de $OPTARG
	  - Os dois pontos são utilizados quando faltou informar um argumento
	    obrigatório. A opção em questão estará dentro de $OPTARG
	- Nenhum shift é necessário, pois o getopts cuita de todo o processo de
	  avaliação de cada opção da linha de comando
	- Por fim, se processadas todas as opções e ainda sobrar algum argumento,
	  ele também pode ser obitido, Isso geralmente acontece quando o aplicativo
	  aceita receber um nome de arquivo como último argumento, assim como o
	  grep. A variável $OPTIND guarda o índice com a posição deste arumento,
	  Como podem ser vários argumentos restantes, o mais fácil é usar um 
	  shift N para apagar todas as opções, sobrando apenas os argumentos. Onde
	  N=$OPTIND - 1

