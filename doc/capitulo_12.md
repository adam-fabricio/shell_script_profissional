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

## Configurando o Apache2

Conforme descrito é necessário fazer algunmas mudança devido a atualização do
apache.

1- O Apache atual é o 2 e não o 1
2- Diretório de configuração agora é /etc/apache2
3- Para ativar o módulo CGI é necessário criar um link simbolico de :
	/etc/apache2/mods_available/cgi.load para /etc/apache2/mods_enabled.load
4- Para reconhecer os arquivos .cgi deve alterar a configuração em
 	/etc/apache2/mods_available/mime.conf
5- O usuário configurado está em /etc/apache2/envvars.conf e é www-data


