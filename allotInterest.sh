#!/bin/bash

file="/home"

value=$(awk '{print $1"_"$2"_"$3"_"$4"_"$5}' ${file}/sysad-task1-User_Accounts.txt)
for i in $value
do
	declare -A intrest
	branch=$(echo $i |cut -d '_' -f 2)
	values=$(awk '{print $1"_"$2}' ${file}/${branch}/Daily_Interest_Rates.txt )
	for j in $values
	do
	key=$(echo $j |cut -d '_' -f 1)
	values=$(echo $j |cut -d '_' -f2-)
	values=${values::-2}
	intrest[$key]=$values 
	done
	intrests=0
	person=$(echo $i |cut -d '_' -f 1)
	a=$(cut -d '_' -f 3 <<< "$i")
	b=$(cut -d '_' -f 4 <<< "$i")
	c=$(cut -d '_' -f 5 <<< "$i")
	a=${intrest[$a]}
	b=${intrest[$b]}
	c=${intrest[$c]}
	[[ -n $a ]] && intrests=$(bc <<< "$intrests+$a")
	[[ -n $b ]] && intrests=$(bc <<< "$intrests+$b")
	[[ -n $c ]] && intrests=$(bc <<< "$intrests+$c")
	p=$(cat ${file}/${person}/Current_Balance.txt)
	money=$(bc -l <<< "($intrests*$p)/(100*365)")
	money=$(bc -l <<< "$money+$p")
	echo $money > ${file}/${person}/Current_Balance.txt
done


