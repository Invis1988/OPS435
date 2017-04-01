#!/bin/bash    
#title           :zodiac.bash
#description     :This script will generate a zodiacs and horoscopes
#author		 :Kieran O'Connor
#date            :20170401
#version         :1  
#usage		 :./zodiac
#notes           :Must have CSV files formatted as zodiac,yyyymmdd,yyyymmdd to use with while loop. EX: Dragon,19880122,19890204
#bash_version    :4.1.5(1)-release
case $# in 
   1) year=${1:0:4}
	month=${1:4:2}
   	   day=${1:6:2} ;;
   3) year=$1
	   month=$2
	     day=$3 ;;

     6) if [[ $1 = "-y" ]]; then
	    year=$2
    elif [[ $3 = "-y" ]]; then
	   year=$4
   elif [[ $5 = "-y" ]]; then
	  year=$6
  fi
	if [[ $1 = "-m" ]]; then
	    month=$2
    elif [[ $3 = "-m" ]]; then
	   month=$4
   elif [[ $5 = "-m" ]]; then
	  month=$6
  fi
if [[ $1 = "-d" ]]; then
	    day=$2
    elif [[ $3 = "-d" ]]; then
	   day=$4
   elif [[ $5 = "-d" ]]; then
	  day=$6
  fi ;;
  *) echo "USAGE: yyyymmdd, yyyy mm dd, or specify -y -m -d"
esac
`date -d $year$month$day >/dev/null 2>/dev/null`
test $? -eq 1 && echo "USAGE: yyyymmdd, yyyy mm dd, or specify -y -m -d" && exit 1
wmonth=$(date -d $year$month$day +%-m | sed 's/ //g')
query="$wmonth$day"
while IFS=, read -r term start end; do
	((query >= start)) && ((query <= end)) && echo "Your Western Zodiac is $term"
done <west
eyear=$((year - 60))
query="$eyear$month$day"
while IFS=, read -r term start end; do
	((query >= start)) && ((query <= end)) && echo -n "Your Chinese Zodiac is $term"
done <chzod
query="$year$month$day"
while IFS=, read -r term start end; do
	((query >= start)) && ((query <= end)) && echo " $term"
done <animal
echo "You were born on a $(date -d $year$month$day +%A)"
echo -e "Here's your horoscope:\n `fortune`"
