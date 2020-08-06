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
echo ""
echo ":::::::::::::::::::::::::: Singlet Coin Toss :::::::::::::::::::::::::::"
echo ""
for i in ${!singletDict[@]}
do
	echo " In singlet We get" $i "for" ${singletDict[$i]}"%"
done
echo ""
echo ":::::::::::::::::::::::::: Doublet Coin Toss :::::::::::::::::::::::::::"
echo ""
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
echo ""
echo ":::::::::::::::::::::::::: Triplet Coin Toss :::::::::::::::::::::::::::"
echo ""
for ((i=0,j=0;i<100;i+=3,j+=1))
do
        sample1=${SingleArray[$i]}
        sample2=${SingleArray[$i+1]}
	sample3=${SingleArray[$i+2]}

        CheckTriplet[$j]="$sample1$sample2$sample3"

        case ${CheckTriplet[$j]} in
                "HHH")
                        count_HHH=$(($count_HHH+1))
                ;;
                "HHT")
                        count_HHT=$(($count_HHT+1))
                ;;
                "HTH")
                        count_HTH=$(($count_HTH+1))
                ;;
                "THH")
                        count_THH=$(($count_THH+1))
                ;;
		"HTT")
			count_HTT=$(($count_HTT+1))
		;;
		"THT")
			count_THT=$(($count_THT+1))
		;;
		"TTH")
                        count_TTH=$(($count_TTH+1))
                ;;
		"TTT")
			count_TTT=$(($count_TTT+1))
		;;
		*)
			extra=$(($extra+1))
		;;
        esac
done

#echo ${CheckTriplet[@]}

echo " In Doublet Combination we get HHH :: "$count_HHH"%"
echo " In Doublet Combination we get HHT :: "$count_HHT"%"
echo " In Doublet Combination we get HTH :: "$count_HTH"%"
echo " In Doublet Combination we get THH :: "$count_THH"%"
echo " In Doublet Combination we get HTT :: "$count_HTT"%"
echo " In Doublet Combination we get THT :: "$count_THT"%"
echo " In Doublet Combination we get TTH :: "$count_TTH"%"
echo " In Doublet Combination we get TTT :: "$count_TTT"%"
echo " There are Some Extra Toss Remaining they are :: "$extra"%"
