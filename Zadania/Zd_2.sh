#!/bin/bash
if [ -e "$1" ]
then
  echo "Plik $1 już istnieje!"
else
  echo "To jest nowy plik.">$1
fi
