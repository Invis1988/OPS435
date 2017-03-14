#!/bin/bash
#Author: Kieran O'connor
#Purpose: Compute whether or not year is a leap year

#Prompt user for input
read -p "Please enter a year: " year 
#calculate if year is leap year by dividing input by 4, then 100, then 400.
if $(($year%4)) == 0 ;then
	echo "$year is a leap year!"
	exit 0
elif  $(($year%100)) == 0 ;then
	echo "$year is a leap year!"
	exit 1
elif  $(($year%400)) == 0 ;then
	echo "$year is a leap year!"
	exit 2
	#if input does not divide into 0, it is not a leap year
fi
