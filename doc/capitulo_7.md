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

##  Notas

- Para forçar o grep a pesquisar po palavbras normais, desligando o suporte às
	expressões regulares, use a opção -f(--fixed0strings) ou chame-o como
	fgrep. Pode ser útil quando a palavra que você quer pesquisar possui algum 
	dos	simbolos especiais considerados metacaracteres.
- Para evitar o problema de "$" em regex e para identificar variaveis use
	sempre aspas nas variaveis
- Use lista negada com cautela. Negar alguns caracteres significa permitir
    todos os outros! Números, simbolos, TAB e espaço em branco também fazem
    parte de "qualquer caractere, exceto vogais". Em nosso exemplo atual isso
  	Não atrapalha, mas tenha sempre em mente que essa negação é bem 
	abrangente.
- O ponto é um caracter especial, para casar um ponto literal, escape-o com a
	contrabarra "\"

## Detalhes

- O intervalo a-z não inclui os caracteres acentuados. Para procurar texto em
  portugês acentuado [a-záéíóúàââêôãõç]. Caso o sistema esteja corretamente
  configurado pode se usar o [[:lower:]] ou [[:upper:]]
- Dependendo do aplicativo, a sintaxe das expressões pode ser diferente da que
  usamos no egrep. No sed e no grep, por exemplo, as chaves e o "ou" devem ser
  escapados para serem especiais.
  Programa		| Opcional	| Mais	| Chaves	| Ou	| Grupo
  ------------	|---------	|------	| -------	| -----	| ------
  awk			| ?			| +		| -			| |		| ()
  egrep, awk	| ?			| +		| {,}		| |		| ()
  emacs, find	| ?			| +		| -			| \|	| \(\)
  grep, sed		| \?		| \+	| \{,\}		| \|	| \(\)
  vim			| \=		| \+	| \{,}		| \|	| \(\)
- Há programas para auxiliar o aprendizado de expressões regulares, o txt2regex
  (http://txt2regex.sourceforgr.net) (http://regexpal.com) 
