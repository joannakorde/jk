#!/bin/bash
count=0;
for x in $@
do
	count=$[count + 1]
	tablica[$count]=$x
done
echo -n "${tablica[@]} => "
ret=$count
until [ "$count" -le "0" ]; do
	echo -n "${tablica[$count]} "
	count=$[count - 1]
done
echo ""
echo "Liczba podanych argumentow   $ret"
