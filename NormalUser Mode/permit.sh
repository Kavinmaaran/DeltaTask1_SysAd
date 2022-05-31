##!/bin/bash

file="/home/CEO"

for j in $(ls -d Branch*)
do
    chown ${j}_manager:${j} ${file}/${j}
    sudo chmod 770 ${file}/${j}
    cd $j
    groupadd -f $j
    sudo setfacl -R -m u:$j_manager:rwx ${file}/$j
    for i in $(ls -d ACC*)
    do
        sudo chmod 770 ${file}/$j/$i
        sudo usermod -aG $i CEO
        sudo usermod -aG $j $i
        sudo chown $i:$i ${file}/$j/$i/*.txt
        #sudo chown $i:$j ${file}/$i
        sudo setfacl -R -m u:CEO:rwx ${file}/$j/$i
        sudo usermod -aG $i ${j}_manager
        sudo setfacl -R -m u:${j}_manager:rwx ${file}/$j/$i
    done
    sudo usermod -aG ${j} CEO
    chown ${j}_manager:${j} ${file}/${j}/$j/*.txt
    chown ${j}_manager:CEO ${file}/${j}/$j
    sudo setfacl -R -m u:CEO:rwx ${file}/${j}/$j
    sudo chmod 700 ${file}/${j}/$j
    sudo chmod 600 ${file}/${j}/$j/*.txt
    sudo setfacl -m u:CEO:rwx ${file}/${j}/$j
    sudo setfacl -m u:CEO:rwx ${file}/${j}/$j/*.txt
    cd ..
done
