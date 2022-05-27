#!/bin/bash

file="/home/kali/Desktop/sys"
sudo useradd CEO
sudo usermod -aG sudo CEO
sudo setfacl -R -m u:CEO:rwx ${file}
sudo setfacl -R -m u:Branch1_manager:rwx ${file}/Branch1
sudo setfacl -R -m u:Branch2_manager:rwx ${file}/Branch2
sudo setfacl -R -m u:Branch3_manager:rwx ${file}/Branch3
sudo setfacl -R -m u:Branch4_manager:rwx ${file}/Branch4
value=$(awk '{print $1$2}' sysad-task1-User_Accounts.txt )
for i in $value
do
	sudo chmod 700 ${file}/${i:0:7}/Transaction_History.txt
	sudo chmod 700 ${file}/${i:0:7}/Current_Balance.txt
	
done
value=$(awk '{print $2}' sysad-task1-User_Accounts.txt | sort | uniq)
for i in $value
do
	sudo chmod 700 ${file}/${i}/Branch_Current_Balance.txt
	sudo chmod 700 ${file}/${i}/Branch_Transaction_History.txt
done
