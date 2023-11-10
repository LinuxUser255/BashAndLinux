#!/usr/bin/env zsh

# create 9 directories lab-01 to lab-09, 
# then touch one file in each directory sqli-01.py to sqli-09.py
for (( i = 1; i <= 9; i++ )); do
  mkdir -p lab$i
  touch lab$i/sqli$i.py

done

# create 19 directories lab-10 to lab-19 
# then touch one file in each directory sqli-lab-10.py to  sqli-lab-19.py
for (( i = 10; i <= 19; i++ )); do
  mkdir -p lab$i
  touch lab$i/sqli$i.py

done
