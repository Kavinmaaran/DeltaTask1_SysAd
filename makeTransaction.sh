#!/bin/bash

file="/home"

if [ $2 != 0 ];
then 
	a=$(bc <<<$2+$(cat ${file}/$1/Current_Balance.txt))
	[[ $(bc <<< "$a>=0") != 0 ]] && echo $a > ${file}/$1/Current_Balance.txt
	[[ $(bc <<< "$a>=0") != 0 ]] && echo "$1 $2 `date +"%Y-%m-%d %T"`">>${file}/$1/Transaction_History.txt
	[[ $(bc <<< "$a<0") != 0 ]] && echo "low balance availabel amount:$(cat ${file}/$1/Current_Balance.txt)"
else
	echo "usuage: $0 <accountname> <amount(+ - deposit, - - withdraw )>"
fi
