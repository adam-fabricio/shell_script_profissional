#!/bin/bash
#
# shells.sh

rev /etc/passwd | cut -d: -f1 | rev | sort | uniq

