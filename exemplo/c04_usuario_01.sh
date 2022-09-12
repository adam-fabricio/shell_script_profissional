#!/bin/sh
#
# Mostra logins e nomes de usuários do sistema
#Obs,: Lê dados do arquivo /etc/passwd
#
# Aurélio, Novembro 2007
#
###############################################################################

cut -d : -f 1,5 /etc/passwd | tr : \\t
