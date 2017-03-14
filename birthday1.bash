#!/bin/bash
#Compute person's birth day of week
read -p "Please enter your birthday (yyyymmdd): " year month day
echo -n "You were born on a " 
date -d "$year-$month-$day" +%A
