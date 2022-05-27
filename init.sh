#! /bin/bash

file="/home/kali/Desktop/sys"

alias genUser='./genUser.sh'
alias permit='./permit.sh'
alias updateBranch='./updateBranch.sh'
alias allotInterest='./allotInterest.sh'
alias makeTransaction='./makeTransaction.sh'

crontab -l > cron
echo "* * * * * CEO ${file}/../allotInterest.sh" >>cron
crontab cron
rm cron
