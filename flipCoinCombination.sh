#!/bin/bash

flip=$((RANDOM%2))

if [ $flip -eq 1 ]
then
	echo "We Got heads"
else
	echo "We Got Tails"
fi
