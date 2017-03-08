#!/bin/bash
if [ $# -lt 1 ]
then
echo "Za mało paramerów!"
else
  case "$1" in
    "early") echo "It's early";;
    "late") echo "It's late";;
    "day") echo "It's day";;
    "night") echo "It's night";;
    "morning") echo "It's morning";;
    "lunchtime") echo "It's lunchtime";;
    "evening") echo "It's evening";;
    *) echo "Zła pora dnia!"
  esac
fi
