#! /bin/bash

file="/home/CEO"

mv DeltaTask1_SysAd/* .
mv 'NormalUser Mode'/* .
mv 'SuperUser Mode'/* .
rm -rf 'NormalUser Mode'   README.md  'SuperUser Mode' DeltaTask1_SysAd
chmod 770 ${file}/allotInterest.sh ${file}/genSummary.sh ${file}/updateBranch.sh ${file}/src/summary.txt ${file}/src/mean.txt ${file}/src/meanusr.txt ${file}/src/mode.txt ${file}/src/modeusr.txt ${file}/src/median.txt ${file}/src/medianusr.txt
chmod 700 ${file}/aliases.sh ${file}/genUser.sh ${file}/init.sh ${file}/permit.sh 
chmod 777 ${file}/makeTransaction.sh
