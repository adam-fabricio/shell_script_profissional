#!/bin/bash
#
#  form.sh
#  Vamos mostrar uma página html

#  Necessário para o Apache
echo Content-type: text/html
echo

echo "<h1>Os dados enviados foram:</h1>"
echo "<pre>"

#  Lê os dados do formulário via STDIN
read TRIPA

#  Mostra os dados na tela
echo $TRIPA

