#! /bin/bash

file="/home/CEO"
sudo apt install bc

#sudo useradd -m -d /home/CEO CEO

#>4.txt
#chmod 777 4.txt
#sudo setfacl -R -m u:CEO:rwx ${file}/4.txt
#sudo setfacl -R -m u:Branch1_manager:rwx ${file}/4.txt
#sudo setfacl -R -m u:Branch2_manager:rwx ${file}/4.txt
#sudo setfacl -R -m u:Branch3_manager:rwx ${file}/4.txt
#sudo setfacl -R -m u:Branch4_manager:rwx ${file}/4.txt

#sudo mv permit.sh makeTransaction.sh updateBranch.sh init.sh genUser.sh genSummary.sh allotInterest.sh /usr/local/sbin

echo "alias genUser='./genUser.sh'" >> ~/.bashrc
echo "alias permit='./permit.sh'" >> ~/.bashrc
echo "alias updateBranch='./updateBranch.sh'" >> ~/.bashrc
echo "alias allotInterest='./allotInterest.sh'" >> ~/.bashrc
echo "alias makeTransaction='./makeTransaction.sh'" >> ~/.bashrc
echo "alias genSummary='./genSummary.sh'" >> ~/.bashrc
source ~/.bashrc

#crontab -l > cron
#echo "* * * * *  ${file}/allotInterest.sh" >>cron
#crontab cron
#rm cron
