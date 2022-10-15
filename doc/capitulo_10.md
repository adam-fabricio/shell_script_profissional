# Capítulo 10 - Banco de dados com arquivos texto

## Característica do Banco Textual

	* Acesso fácil ao banco -> Fácil mantunção
	* Portabilidade -> pode ser facilmente compartilhado
	* Compactável -> por ser arquivo de texto, é facil compactar
	* Simplicidade -> Fácil compreender editar.
	* Performance -> Maior performance para poucas linhas. 
	* Relacionamento ->	Não possui relacionamento entre os dados
	* Fragilidade -> Por ser arquivo de texto, pode corromper fácilmente.


## Quando usar Banco Textual

	* Guardar dados de estado para fins histŕoicos.
	* Guardar dados temporarios 
	* Guardar informações em um formato intermediario
	* Guardar configurações
	* Agenda de contatos
	* Catálogos.
	* Controle de estoque simples.
	* Controle de tarefas TODO
	* Qulaquer cadastro de dados simples, ou histórico.


## Formato do arquivo.

### Especificação CSV

	* Um registro por linha
	* A primeira linha contém os nomes dos campos
	* As linhas seguintes são os dados
	* Tanto os campos quanto os dados são separados entre si por virgulas.
	* Números são colocados diretamente
	* Texto são colocados "entre aspas"
	* Textos podem conter vírgulas pois estão protegidas pelas aspas.


### Fortamot CSV simplificado

	* Um registro por linha
	* A primeira linha contém os nomes dos campos
	* As linhas seguintes são os dados
	* Tanto os campos quanto os dados são separados entre sí por vírgulas
	* Vírgulas literais são "mascaradas" com um caracterer exótico.


### Específicação CVS utilizado

	* Um registro por linha
	* A primeira linha contém os nomes dos campos
	* As linhas seguintes são os dados
	* O primeiro campo é a chave primária.
	* Tanto os campos quanto os dados são separados entre si por dois-pontos 
	* Dois-pontos literais são mascarados com caracter exótico "§"

## Gerenciamento do banco

	+---------------+  Requisição  +-----------------+         +-----------+
	|               |------------->|    Gerenciador  |  Ação   |   Banco   |
	|   Aplicativo  |  Resultado   |        do       |<------->|  Textual  |
	|               |<-------------|      Banco      |         |           |
	+---------------+              +-----------------+         +-----------+


## Funcionalidade do gerenciador

	* Apagar, criar, alterar, copiar e mover arquivos
	* Apagar, incluir e alterar linhas de arquivo
	* Mostrar, apagar, inserir e modificar registros.


### Melhorias na funcionalidade do programa banco textual

	* Mascarar dados na inserção do dado no banco
	* Checagem adicional na entrada de dados
	* funções de estatística 
		* número de campos
		* número de registros
		* função de ordenamento
		* função de edição de registro
		* log


