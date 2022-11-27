#!/bin/bash
#
# substring.sh

[ $# -ne 0 ] && [[ "$2" == *"$1"* ]] && echo "$1 está contida em $2" 
