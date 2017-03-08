#!/bin/bash
if [ -d "$1" ]
then
  ls "$1"
else
  read -p "Podaj nazwe katalogu: " dir
  ls "$dir"
fi

