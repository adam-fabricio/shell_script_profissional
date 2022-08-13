#!/bin/bash
# 
# regex para localizar e subistituir %s/\(.*\)\(_2\)/\1_3/g
#
# C02_programa_misterioso_4.sh
# 
# O programa recebe dois números e mostra na saida padrão todos os números
# existentes entre eles, inclusive. Essa sequência está pronta para ser 
# usada pelo comando FOR. Casi inutudi i Número inicial, é utilizado o 1.
# 
# Exemplo 1                       
# 
# C02_programa_misterioso_4 5 10
# 5
# 6
# 7
# 8
# 9
# 10
# 
# Exemplo 2      
# 
# C02_programa_misterioso_4.sh 10 5
# 10
# 9
# 8
# 7
# 6
# 5
# 
# Exemplo 3
# 
# C02_programa_misterioso_4.sh 5
# 1
# 2
# 3
# 4
# 5
# 
# uso em script: for i in $(C02_programa_misterioso_4 10); do comandos ; done
# 

## Inicialização das varáveis.
o=+         # Operação a ser feita. Pode ser + ou -
a=1         # Valor padrão de início da contagem
z=${1:-1}   # Valor do final da contagem recebido em $1 (padrão é 1)

# 
# A variável 'a' é o número de inicio e a variável 'z' é o final.
# 
# O código anterior serve para quando o usuário passar apenas um valor na
# linha de comando, que seroa o valor "final" da contagem. Por isso
# a=1 e z=$1.
# 
# Caso o programa seja chamado sem parâmetros, 'z' também é definido 
# como 1. Como a=1 e z=1, o programa retorna apenas o número 1.
# 
# 

[ "$2" ] && { 

    # Foram passados 2 parâmetros, o $1 é o inicio e $2 é o fim.
    a=$1 
    z=$2 
}  

# ###
# Se o número inícial $a for maior que o número final ($z),
# faremos uma contaem regressiva, por isso a operação é definida como subtração.
# 

[ $a -gt $z ] && o=-


###
# Loop da contagem (progressiva ou regressiva)
# 
# A cada volta, adiciona ou subtrai 1 do valor inicial,
# até que ele se iguale ao final.
# 
# o eval executa o resultado da expansão de variáveis.
# Supondo o='-' e a=3, o eval executará o comando a=$((3+1)).
# 

while [ $a -ne $z ]; do 
    echo $a                 # mostra a contagem atual 
    eval "a=\$((a $o 1))"   # efetua a operação (+1 ou -1)
done

echo $ai                    # mostra o último valor

