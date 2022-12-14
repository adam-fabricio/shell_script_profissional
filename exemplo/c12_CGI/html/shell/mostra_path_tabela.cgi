#!/bin/bash
#  mostra_path_pre.cgi

#  Vamos mostrar uma página HTML
echo Content-type: text/html
echo
#  Adiciona um diretório falso ao path
PATH=$PATH:/noel
#  Titulo da página
echo "<H1> Componentes de seu PATH</H1>"
#  Inícia uma TABELA
echo "<TABLE BORDER='1' CELLSPACING='0' CELLPADDING='5'>"
#  Para cada diretório do $PATH: do
IFS=:
for diretorio in $PATH; do 
	#  Confirme se ele existe
	if test -d $diretorio; then
		extra="<FONT COLOR='green'>existe</FONT>"
	else
		extra="<FONT COLOR='red'>não existe</FONT>"
	fi
	#  E mostre o resultado na tela linha da tabela
	echo "<TR><TD>$diretorio</TD><TD>$extra</TD></TR>"
done
#  Fecha a lista.
</TABLE>


