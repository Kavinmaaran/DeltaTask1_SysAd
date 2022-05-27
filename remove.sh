#!/bin/bash

file="/home/kali/Desktop/sys"

value=$(awk '{print $1$2}' sysad-task1-User_Accounts.txt )
for i in $value
do
	sudo userdel -r ${i:0:7}
done

value=$(awk '{print $2}' sysad-task1-User_Accounts.txt | sort | uniq)
for i in $value
do
	sudo userdel -r ${i}_manager
done
