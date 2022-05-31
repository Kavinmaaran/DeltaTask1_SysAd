#!/bin/bash

file="/home/CEO"
user=$USER
z=$1
> 4.txt
[[ "$user" != "CEO" ]] && user=$(echo $user |cut -d '_' -f 1)
[[ $# -eq 0 ]] && z="$file/$user/Branch_Transaction_History.txt"
[[ "$user" == "CEO" ]] && unippl=$(awk '{print $1}' a=$a $z | sort | uniq | head -n -1)
[[ "$user" != "CEO" ]] && unippl=$(awk '{if($2 ==a){print $1}}' a=$user sysad-task1-User_Accounts.txt |sort | uniq)

for k in {1..12}
do
    min=0
    max=0
    for i in $unippl
    do
    	if [ $k -lt 10 ];
    	then
    		c="2022-0$k"
        	pt=$(awk '{if ($1==a&&$3~b)print $1"_"$3"_"$4"_"$2}' a=$i b=$c $z | sort)
        else
        	c="2022-$k"
        	pt=$(awk '{if ($1==a&&$3~/2022-b/)print $1"_"$3"_"$4"_"$2}' a=$i b=$c $z | sort)
        fi
        if [[ ! -z $pt ]];
        then
            end=0
            start=0
            for j in $pt
            do
                money=$(echo $j |cut -d '_' -f 4)
                [[ $start -eq 0 ]] && start=${money}
            end=$((money+end))
            done
            change=$((end-start))
            if [ "$change" -lt 0 ];
            then 
                change=${change#-}
            fi

            printf "$k $i $change\n" >> 4.txt
        fi
    done
    minn=$(awk '{if ($1==a)print $3"_"$2}' a=$k 4.txt | sort -nk1| head -n 1)
    maxn=$(awk '{if ($1==a)print $3"_"$2}' a=$k 4.txt | sort -nk1| tail -n 1)
    min=$(echo $minn |cut -d '_' -f 1)
    minacc=$(echo $minn |cut -d '_' -f 2)
    max=$(echo $maxn |cut -d '_' -f 1)
    maxacc=$(echo $maxn |cut -d '_' -f 2)
    [[ $max -ne 0 ]] && echo "Month:$k ,Max Change:$maxacc by $max ,Min Change:$minacc by ${min}"
done
rm 4.txt
