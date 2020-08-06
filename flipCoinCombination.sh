#!/bin/bash

declare -A singletDict

function flipCoin(){

	for((i=0;i<100;i++))
	do
		count=0
		flip=$((RANDOM%2))
		if [ $flip -eq 1 ]
		then
			heads=$(($heads+1))
			SingleArray[$i]="H"
		else
			tails=$(($tails+1))
			SingleArray[$i]="T"
		fi
	done
}

flipCoin $heads $tails ${SingleArray[@]}

#echo ${SingleArray[@]}

singletDict[heads]=$heads
singletDict[tails]=$tails

for i in ${!singletDict[@]}
do
	echo " In singlet We get" $i "for" ${singletDict[$i]}"%"
done

for ((i=0,j=0;i<100;i+=2,j+=1))
do
	sample1=${SingleArray[$i]}
	sample2=${SingleArray[$i+1]}
	CheckDoublet[$j]="$sample1$sample2"

	case ${CheckDoublet[$j]} in
		"HT")
			count_HT=$(($count_HT+1))
		;;
		"HH")
			count_HH=$(($count_HH+1))
		;;
		"TT")
			count_TT=$(($count_TT+1))
		;;
		"TH")
			count_TH=$(($count_TH+1))
		;;
		*)
			extra=$(($extra+1))
		;;
	esac
done

#echo " Combination of Doublet are :: " ${CheckDoublet[@]}
echo " In Doublet Combination we get HT :: "$count_HT"%"
echo " In Doublet Combination we get HH :: "$count_HH"%"
echo " In Doublet Combination we get TT :: "$count_TT"%"
echo " In Doublet Combination we get TH :: "$count_TH"%"

