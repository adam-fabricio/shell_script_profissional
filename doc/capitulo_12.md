#  Capitulo 12 - Programação Web (CGI)

O CGI (Common Gateway Interface) é uma maneira simples de se rodar programas
pela internet.

## O Funcionamento basico do CGI.

*  Pelo navegador, o usuário acessa o endereço do seu programa.
*  O usuário preenche alguns dados em um formulário e parte o botão enviar.
*  O programa é chamado, faz o processamento e retorna uma outra página.
*  Essa nova pagina pode ter mais comandos e botões para que outros programas
   sejam executados, ou pode ser o resultado final.
*  Não há entrada padrão (STDIN)
*  Não há opções de linha de comando.
*  A saída padrão (STDOUT) é enviada diretamente ao navegador
*  Não há interatividade, cada chamada ao programa deve chegar até o fim e
   mostra algo na saída.
*  Os dados são passados ao programa por meio de formulários preenchidos pelo
   usuário.
*  O acesso ao programa é transparente para o usuário. Ele vê apenas o
   resultado.
*  A saída do programa deixa de ser limitada pelo console e sua fonte fixa.
*  O CGI contruirá uma atraente página de Internet, com alinhamento, imagens,
   tabelas e todos os recursos de um site interessante.
*  Acabaram as preocupações com permissões de usuário, PATH, pré requisitos,
   configurações do sistema e outros problemas importantes que ocorrem quando o
   programa precisa rodar em um ambiente desconhecido.
*  No CGI há uma cópia do código, que roda em um servidor com ambiente
   configurado e conhecido pelo programador

## Vantagens e desvantagens do CGI em shell.

###  Vantagens   

*  Integração com o sistema, facilidade e rapidez de desenvolvimento
*  Programas pequenos e médios tem execução instantânea 
*  Os requisitos de sistema para rodar o programa são mínimos.
*  Configuração mínima, basta configurar o servidor HTTP (APACHE)
*  É possível transformar em CGI qualquer programa em shell.

###  Desvantagens

*  A obtenção de dados preenchida em formulário é trabalhosa.
*  É possível usar modelos (templates) para páginas HTML, mas deve-se tomar o
   cuídado de evitar construções que possam ser interpretadas pelo shell como
   $variaveis e `subshells`
*  Tanto para obtenção dos dados quanto para o uso de modelos, a tentação em
   usar eval é grande. E, ao usa-lo, varias verificações de segurança
   precisarão ser feitas, pois o usuário poderá enviar textos com códigos
   embutidos. Outro problema será a legibilidade do código, que ficará
   prejudicada.

##  Configurando o Apache2

Conforme descrito é necessário fazer algunmas mudança devido a atualização do
apache.

1- O Apache atual é o 2 e não o 1
2- Diretório de configuração agora é /etc/apache2
3- Para ativar o módulo CGI é necessário criar um link simbolico de :
	/etc/apache2/mods_available/cgi.load para /etc/apache2/mods_enabled.load
4- Para reconhecer os arquivos .cgi deve alterar a configuração em
 	/etc/apache2/mods_available/mime.conf
5- O usuário configurado está em /etc/apache2/envvars.conf e é www-data

##  Característica do arquivo CGI.

Para o CGI funcionar, é necessário:
*  O arquivo ter permissão para executar pelo usuário do Apache.
*  Deve enviar a primeira linha o tipo de conteúdo. "Content-type"
*  Na segunda linha deve ser em branco.

##  HTML

###  Etiquetas (TAG)

Tag           | Descrição 
------------- | ---------------------------------
H1            |  Título                                                       
H2            |  Subtítulo                                                    
P             |  Parágrafo                                                    
B             |  Negrito                                                      
I             |  Itálico                                                      
U             |  Sublinhado                                                   
FONT          |  Fonte (tipografia)                                           
BR            |  Quebra de linha (\n)                                         
PRE           |  Código (fonte fixa, mantém quebras de linha)                 
HR            |  Linha separadora                                             
IMG           |  Imagem, foto                                                 
A             |  Link                                                         
UL, LI        |  Lista de itens                                               
TABLE, TR, TD |  Tabela                                                       
                                                                              

*  Um arquivo HTML é um arquivo de textonormal, preém com tags marcando as
   palavras
*  As tags sempre são colocadas entre os sinais de menor e maior, <assim>
*  Algumas tags abrem e fecha e outras são sózinha. 
*  Algumas tags aceitam argumentos opcionais, modificando seu comportamento
   original.
*  As tags não são sencitivas.
*  Vários espaços consectivos e linhas em branco aparecem como um único espaço
   em branco no navegador
*  Pode-se colocar tag dentro da tag
*  Pode acumular tag ao redor de um trecho 

###  Formulários, a interação com o usuário.

*  As tag de formulário são como as outras tags do HTML
*  A tag form abriga o formulário. Todas as outras Tags devem estar neal
*  O atributo method da tag FORM geralmente é preenchido com o POST.
*  O atributo action da tag form é o endereço do CGI
*  O atributo name é o mesmo para todas as tag do grupo
*  Coloque o atributo checked para que um atributo seja marcado por padrão
*  O atributo selected tem a mesma função
*  No checkbox, radio e select as escolhas retornam o valor que está em value
*  use o atributo SIZE="4" para que ao expandir mostre 4 itens



###  Tags em formulários

tipo     |  Descrição
-------- |  -------------------------------
Form     |  Formulário
Text     |  Caixa de texto 
Textarea |  Caixa de texto (várias linhas)
Checkbox |  Opção (liga/desliga)
radio    |  Opção (exclussiva)
select   |  Menu
hidden   |  Valor escondido
submit   |  Botão de envio

##  Caracters especiais do STDIN

Caracter |  Significado
-------- |  ---
&        |  Separa pares de campo e valor
=        |  separa os componentes de cada par.
+        |  Mascara espaços em branco
%HH      |  HH é o código asc do caracter, em hexadecimal

## Variaveis de ambiente do CGI
O apache possui algumas variaveis de ambientes pre-definidas

Variável         |  Descrição
---------------  |  -----------
DOCUMENT_ROOT    |  Diretório raiz dos documentos HTML
HTTP_USER_AGENT  |  Nome do navegador do cliente
QUERY_STRING     |  Parâmetros de formulário
REMOTE_ADDR      |  IP do cliente
REQUEST_METHOD   |  Metodo requisitado (GET ou POST)
REQUEST_URI      |  Endereço da página requisitada
SERVER_ADDR      |  IP do servidor
SERVER_NAME      |  Nome do servidor 

##  Depurar CGI

Lista de conpatibilidade.


Tipo de depuração            |  Funciona no ambiente CGI?
---------------------------  |  -------------------------
Verificação de sintaxe (-n)  |  Sim (pela linha de comando)
Debug com echo               |  SIM
Debug com a opção -x         |  NÃO (vem antes do Content-type)
Debug com o set -x           |  Sim (colocar depois do Content-type)
Execução passo a passo       |  NÃO (CGI não é interativo)
Debug personalizado          |  SIM
Debug categorizado           |  SIM

A verificação da sintaxe do script (bash -n) pode ser feita normalmente na
linha de comando já que ela idepende de opções e de ambiente.

Errado
```
#!/bin/bash
#  Conecta a STDERR (Usada pelo set -x) com a STDOUT
exec 2>&1
#  Liga a depuração
set -x

echo Content-type: text/html
echo
```

Certo
```
echo Content-type: text/html
echo
#  Conecta a STDERR (usada pelo set -x) com a STDOUT
exec 2>&1
# Liga Depuração
set -x
```

Como a saída é o navegador é possivel explorar a forma de saída do DEBUG, ou
seja é melhor utilizar uma funçaõ personalizada de debug
```
Debug(){
	[ "$DEBUG" !=1 ] && return
	echo '<p STYLE="color:red;background:yellow">'&*'</P>'
}
```
##  Considerações de segurança

Ao utilizar o eval ele executa o código como se ele estivesse sendo digitado.
E com isso ao ter um capo aberto para digitação, pode ser inserido um código e
com isso abrir um subshell e apresentar informações sensiveis.
Uma solução rápida para isso é escapar caracter vitais como a crase "`" e "$"
```
urldecode() {
	echo -e $(sed 's/%/\\x/g') | tr -d '$`'
}
```

