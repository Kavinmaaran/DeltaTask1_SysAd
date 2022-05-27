#!/bin/bash

file="/home/kali/Desktop/sys"
groupadd -f Branch1
groupadd -f Branch2
groupadd -f Branch3
groupadd -f Branch4

value=$(awk '{print $1$2}' sysad-task1-User_Accounts.txt )
for i in $value
do
	sudo useradd -m -d ${file}/${i:0:7} ${i:0:7}
	sudo touch ${file}/${i:0:7}/Transaction_History.txt
	sudo echo "500">${file}/${i:0:7}/Current_Balance.txt
	sudo chown ${i:0:7}:${i:7:7} ${file}/${i:0:7}/*.txt
done

value=$(awk '{print $2}' sysad-task1-User_Accounts.txt | sort | uniq)
for i in $value
do
	sudo useradd -m -d ${file}/${i} ${i}_manager
	sudo touch ${file}/${i}/Branch_Transaction_History.txt
	sudo touch ${file}/${i}/Branch_Current_Balance.txt
	chown ${i}_manager:${i} ${file}/${i}/*.txt
done
