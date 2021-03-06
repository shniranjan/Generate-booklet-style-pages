#!/bin/bash

# Version: 0.0.01
# Output pages order for printing double sided 2 pages per page booklet
# When printing selet prin pages and copy paste the generated page sequences
# Syntax is bash printing.run <total pages>

abc=$1
mod=$((abc%4))
if [[ $mod -eq 0 ]];
then
nval=$abc
else
nval=$((abc + 4 - mod))
fi
declare -a pages
begin=1
end=$nval
mid=$((nval/2))
i=0

while [[ $((nval)) -gt  $mid ]]; do
pages[i]=$nval
(( nval -= 1  ))
(( i += 1 ))
pages[i]=$begin
(( begin += 1 ))
(( i += 1 ))
pages[i]=$begin
(( begin += 1 ))
(( i += 1 ))
pages[i]=$nval
(( nval -= 1 ))
(( i += 1 ))
done

for i in "${pages[@]}"
do
if [ $i -gt $abc ]; then
echo -n 0", "
else
echo -n $i", "
fi
done
echo
