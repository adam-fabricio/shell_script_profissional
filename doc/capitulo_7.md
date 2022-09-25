#	Capítulo 7 - Expressões regulares

##  Lista dos principais metacaracteres

Meta	| Nome			|	Posicionamento
-------	| -------------	| -----------------
^		| Circunflexo	| Representa o começo da linha 
$		| Cifrão		| Representa o fim da linha.
[abc]	| Lista			| Casa as letras "a", "b" ou "c"
[a-d]	| Lista			| Casa as letras "a", "b", "c" ou "d"
[^abc]	| Lista negada	| Casa qualquer caractere, exceto "a", "b" e "c"
(a|b)	| Ou			| Casa as strings "a" ou "b"
a{n}	| Chaves		| Casa a letra "a" n duas vezes
a{n,m}	| Chaves		| casa a letra "a" de n a m vezes
a{n,}	| Chaves		| casa a letra "a" no mímino duas vezes
a?		| Opcional		| casa a letra "a" zero ou uma vez
a		| Asterisco		| casa a letra "a" zero ou mais vezes
a+		| Mais			| casa a letra "a" uma ou mais vezes
.		| Ponto			| Casa um caracter qualquer
.*     *| Curinga		| Casa qualquer coisa, é o tudo e o nada.

##  Equivalencia entre o Glob e expressões regulares

Gloob(shell)	|	Expressões regulares
-------------	| ----------------------
*				| . *
?				| .
{a,b}			| (a|b)
[abc]			| [abc]
[^abc]			| [^abc]
[0-9]			| [0-9]
*.txt			| .*\.txt
arquivo-??.txt	| arquivo-..\.txt
[Aa]rquivo.txt	| [Aa]rquivo\.txi

##  Outros repetidores

Meta	| Nome		| Equivalente	| Descrição
------	| ---------	| ------------	| --------
?		| opicional	| {0,1}			| Pode aparecer ou não (opicional)
*		| asterisco	| {0,}			| Pode aparecer em qualquer quantidade
+		| mais		| {1,}			| Deve aparecer no mínimo uma vez

