#!/bin/ba
# 
# C02_programa_misterioso_2.sh
# 
# O programa recebe dois números e mostra na saida padrão todos os números
# existentes entre eles, inclusive. Essa sequência está pronta para ser 
# usada pelo comando FOR. Casi inutudi i Número inicial, é utilizado o 1.
# 
# Exemplo 1                       
# 
# C02_programa_misterioso_2 5 10
# 5
# 6
# 7
# 8
# 9
# 10
# 
# Exemplo 2      
# 
# C02_programa_misterioso_2.sh 10 5
# 10
# 9
# 8
# 7
# 6
# 5
# 
# Exemplo 3
# 
# C02_programa_misterioso_2.sh 5
# 1
# 2
# 3
# 4
# 5
# 
# uso em script: for i in $(C02_programa_misterioso_2 10); do comandos ; done
# 

o=+ a=1 z=${1:-1}; [ "$2" ] && { a=$1; z=$2; } ; [ $a -gt $z ] && o=-
while [ $a -ne $z ]; do echo $a ; eval "a=\$((a $o 1))"; done; echo $a

