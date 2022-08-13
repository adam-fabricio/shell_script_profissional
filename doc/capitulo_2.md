# CAPITULO 2 - CONTROLE DE QUALIDADE


Como deixar o código mais amigáveis e informativo

    * Cabeçalho inicial com uma explicação geral do funcionamento.
        [nota] Pode se criar um arquivo como Readme no lugar.]
    * Código alinhado e bem espaçado verticalmente.
    * Comentários explicativos e esclarecedores.
    * Nomes descritivos para funções e variáveis.
    * Controlo de alterações e versões.
    * Estruturas interna coesa e padronizada.

### Extras

    * Manual de uso.
    * Manual técnico.
    * Suítes de testes.
    * Registro histórico das mudanças (changelog).
    * Base de problemas conhecidos.
    * Versões beta.
    * Arquivo de exemplo de comportamento (se aplicável).

## Código Limpo
    
    * Colocar apenas um comando por linha.
    * Alinhar verticalmente comandos de um mesmo bloco, usando o espaços ou TAB's
    * Deslocar o alinhamento à direita a cada bloco novo.
    * Usar linhas em branco para separar trechos.
    * Não ultrapassar o limite de 80 colunas por linha
        - Para quebrar linha usar "\"
            dialog --title "Minha Telinha" --msgbox "Esta é a minha mensagem" 0 0
            pode ficar:
            dialog \
                --title "Minha telinha" \
                --msgbox "Esta é a minha mensagem" \
                0 0

## Código comentado
    1- Comentário em bloco, antes de uma seção
    2- Comentário de linha para comandos
    3- Comentário de meia linha para comandos. 

## PREFIXOS ESPECIAIS

    TODO    -> Indica uma tarefa a ser feita
    FIXME   -> Indica um bug conhecido
    XXX     -> Chama atenção;

## COMO COMENTAR BEM

    * Comentar em portugês
    * Usar acentuação normalmente
    * Comentarios curtos, claros e relevantes, sem erros de ortografia e gramática
    * Não fazer comentarios obvios de mais
    * Pode fazer piadas com moderação
    * Não comete um mau código, reescreva-o.

## Variaveis padronizadas
    
    * Dê um nome descritivo para cada varável.
    * Use apenas letras números e sublinhado "\_".
    * Prefira MAIÙSCULAS para variáveis globais e minúsculas para varáveis locais e temporárias.
    * Decida usar apenas português ou ingles.
    * Acentuação não é bem-vinda no nome de uma varável
    * $var1, $var2 e $var3 são definitivamente péssimos nomes de uma varável
    * $a, $m e $x também não ajudam.

## Quando criar uma variável
    * Quando precisar usar o mesmo texto ou número duas ou mais vezes
    * Quando seu programa possuir dados qeu podem ser modificados pelo usuário
    * Quando perceber qeu um texto um dia poderá ser alterado.
    * Quando precisar de configuração de funcionalidades
    * Quando precisar ligar ou desligar uma funcionalidade
    * Quando quiser, varáveis são legais e dificilmente atrapalham.

## Detalhes de variáveis no shell

    * Todas são globais, a não ser quando precedidas pelo comando local.
    * Não são tipadas, etão tanto faz a=5, a="5" ou a ='5'
    * As 'aspas simples' impedem a expansão da variável
    * Podem ser colocadas dentro das aspas juntamente com strings, "assim $PWD".
    * Sempre use "aspas" ao redor de variáveis para manter os espaços em branco e evitar problemas com variáveis vazias
    * Coloque todas as varáveis importantes no início do programa, logo após o cabeçãlho
    * Também podem ser acessadas como $[nome] para evitar confusão com nomes grudados, como $PWDjoão ou para acessar mais do que nove parâmetros: $[10]

# FUNÇÂO

## Como nomear funções
    
    * Dê um nome descritivo para cada função
    * use apenas letras, número e sublinhado
    * Deixe claro quais são as palavras que compõem o nome de uma função, utilizando iniciais em maíuscula ou separando-as com sublinhado.
    * Decida usar somente português ou ingles
    * Acentuação não é bem vinda

## Quando criar uma função

    * Quando precisar usar o mesmo trecho de código duas ou mais vezes
    * Quando quiser pôr em destaque um trecho de código especialista
    * Quando precisar de recursividade
    * Quando quiser, funções sempre ajudam

## Detalhes

    * Sempre use o comando local para proteger todas as varáveis de uma função
    * Função são como comandos do sistema, podendo ser chamadas diretamente pelo nome
    * A função cat tem preferência ao comando cat do sistema
    * Sempre coloque todas as funções no início do programa, logo após as variáveis
    * Uma função deve ser declarada antes de ser chamada, a ordem importa
    * Funções só podem retornar números de 0 a 255, usando o comandoreturn
    * Funções podem retornar strings usando o comando echo.
    * Funções podem gravar variáveis globais, mas evite fazer isso


