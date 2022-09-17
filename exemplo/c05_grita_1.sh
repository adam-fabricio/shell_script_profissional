#!/bin/sh
#
# grita.sh
#
# Mostra uma palavra $(TXT) em maiúscula e com exclamações
# Exemplo: foo-> !!!!!FOO!!!!!

TXT="gritaria"
TXT="     $TXT     "
TXT=$(echo $TXT | tr '' '!')
TXT=$(echo $TXT | tr a-z A-Z)
echo "$TXT"

