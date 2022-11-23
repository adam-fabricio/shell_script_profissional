#!/bin/bash
# ambiente.cgi
#  Vamos mostrar uma página HTML
echo Content-type: text/html
echo

#  Mostra nome do servidor no título
echo "<H!>Ambiente CGI - $SERVER_NAME</H1>"
#  Mostra as varáveis especiais do ambiente CGI
echo "<pre>"
env | sort

