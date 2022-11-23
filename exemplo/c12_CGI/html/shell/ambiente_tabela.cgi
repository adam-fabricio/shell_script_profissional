#!/bin/bash
# ambiente.cgi
#  Vamos mostrar uma página HTML
echo Content-type: text/html
echo

#  Mostra nome do servidor no título
echo "<H1>Ambiente CGI - $SERVER_NAME</H1>"



echo "<table border='1' cellspacing='1' cellpadding='5'>"

#  Mostra as varáveis especiais do ambiente CGI
ambiente=$(env | sort )

for item in $ambiente; do
	variavel=$( echo "$item" | cut -d= -f1)
	valor=$(	echo "$item" | cut -d= -f2)
	echo "<TR><TD>$variavel</TD><TD>$valor</TD></TR>"
done

echo "</table>"
