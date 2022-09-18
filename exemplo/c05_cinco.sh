#!/bin/bash
# cinco.sh
# 
# Conta até cinco.

echo $((0+1))
echo $((0+2))
set -x			#  Liga o Debug
trap read DEBUG	#  Liga passo a passo
echo $((0+3))
echo $((0+4))
trap "" DEBUG	#  Desliga o passo a passo
set +x			#  Desliga o Debug
echo $((0+5))

