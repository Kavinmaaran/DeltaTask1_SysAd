#!/bin/bash

file="/home/kali/Desktop/sys"

if [ $2 -ne 0 ];
then 
	a=$(($2+$(cat ${file}/$1/Current_Balance.txt)))
	[[ $a -ge 0 ]] && echo $a > ${file}/$1/Current_Balance.txt
	[[ $a -ge 0 ]] && echo "$1 $2 `date`">>${file}/$1/Transaction_History.txt
	[[ $a -lt 0 ]] && echo "low balance availabel amount:$(cat ${file}/$1/Current_Balance.txt)"
else
	echo "usuage: $0 <accountname> <amount(+ - deposit, - - withdraw )>"
fi

