#  13 - Dicas preciosa

*  Evite bash2, bash3, bashN

Não utilize novos shells e a tentação de usar as funcionalidades novas, pois
pode não funcionar em outras máquinas.

Caso utilze novas funcionalidades, é necessário verificar a versão do shell
antes de executar o programa, por exemplo, veríficando $BASH_VERSION


*  Sempre utilize aspas ' " 

Use aspas na declaração de varáveis, nos argumentos para comando, ao redor de
toda e qualquer variável sendo referenciada. Use-as mesmo quando não é
necessário.

As aspas resolvem dois problemas:
1- Testes em variáveis vazias
2- Conteúdo com espaços

Para não esquecer as aspas, coloque inicialmente as aspas e depois preenche o
conteúdo, e quando for fazer declarações que é necessário uma estrutura monte
antes de preencher. Ex
```
echo ""
if
	then
	else
fi
```


*  Cuide com varáveis vazias

Elas podem quebrar o programa, ou ter funções perigosas. Se a varável pode ser
vazia, tente definir um valor padrão para ela. 


*  Evite o uso do eval.

Caso for inevitavel, remova ou escape os caracteres perigosos (cifrão e crases)


*  Use && e || para comandos curtos

Use essas opções no lugar do if then else caso o dentro da condicional use
sómente um argumento


*  Use $(...) no luigar de `...`


*  Evite o uso inútil do ls
certo
for arquivo in *; do echo "--> $arquivo"; done
errado
for arquivo in $(ls *); do echo "--> $arquivo"; done


*  Evite o uso do cat

Muitos comandos já aceita receber arquivo como arqumento, e caso não aceite
pode redirecionar a saída como tr a-z A-Z < /etc/passwd


*  Evite pegadinha do while

Se utilizar o while evite usar ele após um pipe, pois ele será executado em uma
subshel, e suas variaveis não serão mais acessadas.


*  Cuidado com o IFS -> Internal Field Separator

Se alterar ele é importante guardar o valor anterior dele e depois restaura-lo

##  Dicas gerais
* Procure usar o menor número de recurso do sistema
* O cut tem uma fração do tamanho do awk
* O tr é menor que o sed
* O sed é menor que o grep
* O sed pode simular o cut e o tr
* O awk pode simular todos os outros
* Caso seja obrigado usar o maior, tente fazer tudo nele
* Prefira usar os comandos built on
* Caso seja necessário instalar ferramentas externas, verifique no programa.
*
