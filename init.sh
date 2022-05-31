#! /bin/bash

file="/home/CEO"

mv DeltaTask1_SysAd/* .
mv 'NormalUser Mode'/* .
mv 'SuperUser Mode'/* .
rm -rf 'NormalUser Mode'   README.md  'SuperUser Mode' DeltaTask1_SysAd
chmod 770 ${file}/alias.sh ${file}/allotInterest.sh ${file}/genUser.sh ${file}/genSummary.sh ${file}/init.sh ${file}/permit.sh ${file}/updateBranch.sh ${file}/src/summary.txt ${file}/src
chmod 777 ${file}/makeTransaction.sh
