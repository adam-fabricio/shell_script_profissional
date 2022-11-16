#  Capitulo 10 - Interfaces amigáveis com o Dialog

Interface gráfica para navegar em janelas através de botões. O "dialog", é uma
interface facil tando para o usuário quanto para o programador.

##  Apresentação rápida do Dialog

    O Dialog pe um programa de console (modo texto que desenha janelas na tela,
com menus, caixas de texto e botões.
	Os comandos do Dialog são todos passados como argumentos, e não aceita
espaço, e para fazer funcionar é necessário usar o eval. e usar \ antes das
aspas. 

```
O uso do eval é perigoso. Todas as recomendações de segurança devem ser levadas
em conta neste caso, também. Sempre que usar o eval pense na origem dos dados
que vai executar e certifique-se de que eles não terçao subshells ou variaveis
que possam ser expandidas na duvida, remova os caracteres perigosos antes do
eval.
```

## Pense no usuário

    Programe pensando no utilizador, centrar no usuário, se o programa for
desengonçado, feio e difícil de usar, os usuários passarão esta impressão
para frente e seus depoimentos não o ajudarçai a aumentar sua base de usuários.
A ferramenta deve ser base de ajuda, e não uma fonte de problemas adicinais
para o usuário. Foque muito no testes com o usuário final. 

## Características do Dialog

*  Funciona tanto no modo gráfico (X11) quanto no console
*  Alinha de comando é longa, cheia de opções.
*  A janela pode ter dimensões fixas ou automáticas
*  O texto da nalea pode ser ajustado automaticamente ou quebras de linhas
   podem ser forçadas usando-se o \n
*  Código de retorno são usados para identificar o uso da tecla ESC e dos
   botões Sim\Não, Ok/Cancel e Help
*  A saída de erro (STDERR) é usada para mostrar textos digitados e tens
   escolhidos pelo usuário, para em seu lugar usar a saída padrão (STDOUT), é
   preciso especificar a opção --stdout
*  O texto dos botões e as cores das janelas são configuráveis
*  O dialog simplesmente mostra uma janela, aguardando a ação do usuário e sai.
   Todo o fluxo de navegação entre janelas deve ser feito manualmente pelo
   programador.
 *  A janela de progresso (gauge) recebe a atualização do estado atual via
	STDIN. Exemplo: (echo 50; sleep 2; echo 100 | dialog --gauge 'abc' 8 40 0)

## Exemplos de todas as Janelas

Nome
--------------|-------------------------------------
calendar      | Vê um calendário e escolhe uma data                           
checklist     | Vê uma lista de opções e escolhe várias.                      
fselect       | digita ou escolhe um arquivo 
gauge         | Vê uma barra de progresso                                      
infobox       | Uma mensagem sem botões                                        
inputbox      | Digitia texto qualquer                                         
menu          | Escolhe um item do menu                                        
msgbox        | Uma janela com o botão ok                                      
passwordbox   | Digita uma senha                                               
radiolist     | Janela com lista de opções e escolhe uma.                      
tailbox       | janela com a saída do comando tail -f
tailboxbg     | Janela com a saída do comando tail -f em segundo plano         
textbox       | Janela com o conteúdo de um arquivo                            
timebox       | Janela para escolher um horário                                
yesno         | Janela com dois botões "yes" e "no"                            
                                                                               
