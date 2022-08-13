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
