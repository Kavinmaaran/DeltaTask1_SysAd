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
	sudo chmod 770 ${file}/${i:0:7}
	sudo usermod -aG ${i:0:7} CEO
	sudo chown ${i:0:7}:${i:0:7} ${file}/${i:0:7}/*.txt
	#sudo chown ${i:0:7}:${i:7:7} ${file}/${i:0:7}
	#sudo setfacl -R -m u:CEO:rwx ${file}/${i:0:7}
	[[ ${i:7:7} == "Branch1" ]] && sudo usermod -aG ${i:0:7} Branch1_manager
	[[ ${i:7:7} == "Branch2" ]] && sudo usermod -aG ${i:0:7} Branch2_manager
	[[ ${i:7:7} == "Branch3" ]] && sudo usermod -aG ${i:0:7} Branch3_manager
	[[ ${i:7:7} == "Branch4" ]] && sudo usermod -aG ${i:0:7} Branch4_manager
	[[ ${i:7:7} == "Branch1" ]] && sudo setfacl -R -m u:Branch1_manager:rwx ${file}/${i:0:7}
	[[ ${i:7:7} == "Branch2" ]] && sudo setfacl -R -m u:Branch2_manager:rwx ${file}/${i:0:7}
	[[ ${i:7:7} == "Branch3" ]] && sudo setfacl -R -m u:Branch3_manager:rwx ${file}/${i:0:7}
	[[ ${i:7:7} == "Branch4" ]] && sudo setfacl -R -m u:Branch4_manager:rwx ${file}/${i:0:7}
done
value=$(awk '{print $2}' sysad-task1-User_Accounts.txt | sort | uniq)
for i in $value
do
	sudo chmod 770 ${file}/${i}
	sudo usermod -aG ${i} CEO
	#chown ${i}_manager:${i} ${file}/${i}/*.txt
	#chown ${i}_manager:${i} ${file}/${i}
	#sudo setfacl -R -m u:CEO:rwx ${file}/${i}
done
