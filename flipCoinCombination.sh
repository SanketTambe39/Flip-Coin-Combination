#!/bin/bash -x

declare -A singletDict

for((i=0;i<100;i++))
do
	flip=$((RANDOM%2))
	if [ $flip -eq 1 ]
	then
		heads=$(($heads+1))
	else
		tails=$(($tails+1))
	fi
done

singletDict[heads]=$heads
singletDict[tails]=$tails

for i in ${!singletDict[@]}
do
	echo " We get" $i "for" ${singletDict[$i]}"%"
done
