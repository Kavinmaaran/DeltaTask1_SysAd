#! /bin/bash

file="/home"

>4.txt
chmod 777 4.txt
sudo setfacl -R -m u:CEO:rwx ${file}/4.txt
sudo setfacl -R -m u:Branch1_manager:rwx ${file}/4.txt
sudo setfacl -R -m u:Branch2_manager:rwx ${file}/4.txt
sudo setfacl -R -m u:Branch3_manager:rwx ${file}/4.txt
sudo setfacl -R -m u:Branch4_manager:rwx ${file}/4.txt

sudo mv permit.sh makeTransaction.sh update.sh init.sh genUser.sh genSummary.sh allotInterest.sh /usr/local/sbin

alias genUser='./genUser.sh'
alias permit='./permit.sh'
alias updateBranch='./updateBranch.sh'
alias allotInterest='./allotInterest.sh'
alias makeTransaction='./makeTransaction.sh'
alias genSummary='./genSummary.sh'

crontab -l > cron
echo "* * * * *  ${file}/allotInterest.sh" >>cron
crontab cron
rm cron