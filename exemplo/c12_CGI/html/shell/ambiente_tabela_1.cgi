#!/bin/bash
# ambiente.cgi
#  Vamos mostrar uma página HTML
echo Content-type: text/html
echo

#  Mostra nome do servidor no título
echo "<H1>Ambiente CGI - $SERVER_NAME</H1>"



echo "<table border='1' cellspacing='1' cellpadding='5'>"

#  Mostra as varáveis especiais do ambiente CGI
env | sort | fgrep = |sed 's/^/<tr><td> / ; s/=/<\/td><td>/'

echo "</table>"
