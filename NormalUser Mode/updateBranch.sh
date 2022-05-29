#!/bin/bash

file="/home/CEO"
count=0
user=$USER
if [[ $user == "Branch1_manager" || $user == "CEO" ]];
then
	value=$(awk '{if($2 =="Branch1"){print $1}}' ${file}/src/User_Accounts.txt)
	for i in $value
	do
		a=$(cat ${file}/Branch1/${i}/Current_Balance.txt)
		count=$(bc -l <<< "$count+$a")
	done
	echo $count >${file}/Branch1/Branch_Current_Balance.txt
fi
if [[ $user == "Branch2_manager" || $user == "CEO" ]];
then
	count=0
	value=$(awk '{if($2 =="Branch2"){print $1}}' ${file}/src/User_Accounts.txt)
	for i in $value
	do
		a=$(cat ${file}/Branch2/${i}/Current_Balance.txt)
		count=$(bc -l <<< "$count+$a")
	done
	echo $count >${file}/Branch2/Branch_Current_Balance.txt
fi
if [[ $user == "Branch3_manager" || $user == "CEO" ]];
then
	count=0
	value=$(awk '{if($2 =="Branch3"){print $1}}' ${file}/src/User_Accounts.txt)
	for i in $value
	do
		a=$(cat ${file}/Branch3/${i}/Current_Balance.txt)
		count=$(bc -l <<< "$count+$a")
	done
	echo $count >${file}/Branch3/Branch_Current_Balance.txt
fi
if [[ $user == "Branch4_manager" || $user == "CEO" ]];
then
	count=0

	value=$(awk '{if($2 =="Branch4"){print $1}}' ${file}/src/User_Accounts.txt)
	for i in $value
	do
		a=$(cat ${file}/Branch4/${i}/Current_Balance.txt)
		count=$(bc -l <<< "$count+$a")
	done
	echo $count >${file}/Branch4/Branch_Current_Balance.txt
fi
if [[ $user == "Branch1_manager" || $user == "CEO" ]];
then
	value=$(awk '{if($2 =="Branch1"){print $1}}' ${file}/src/User_Accounts.txt)
	for i in $value
	do
		(cat ${file}/Branch1/${i}/Transaction_History.txt) >> ${file}/Branch1/Branch_Transaction_History.txt
	done
fi

if [[ $user == "Branch2_manager" || $user == "CEO" ]];
then
	value=$(awk '{if($2 =="Branch2"){print $1}}' ${file}/src/User_Accounts.txt)
	for i in $value
	do
		(cat ${file}/Branch2/${i}/Transaction_History.txt) >> ${file}/Branch2/Branch_Transaction_History.txt
	done
fi
if [[ $user == "Branch3_manager" || $user == "CEO" ]];
then
	value=$(awk '{if($2 =="Branch3"){print $1}}' ${file}/src/User_Accounts.txt)
	for i in $value
	do
		(cat ${file}/Branch3/${i}/Transaction_History.txt) >> ${file}/Branch3/Branch_Transaction_History.txt
	done
fi

if [[ $user == "Branch4_manager" || $user == "CEO" ]];
then
	value=$(awk '{if($2 =="Branch4"){print $1}}' ${file}/src/User_Accounts.txt)
	for i in $value
	do
		(cat ${file}/Branch4/${i}/Transaction_History.txt) >> ${file}/Branch4/Branch_Transaction_History.txt
	done
fi
