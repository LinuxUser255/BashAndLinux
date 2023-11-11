#!/usr/bin/env zsh

# create 9 directories lab-01 to lab-09, 
# then touch one file in each directory file-01.txt to file-09.txt
for (( i = 0; i <= 9; i++ )); do
  mkdir -p lab-0$i
  touch lab-0$i/file-0$i.txt

  rm -rf lab-00

done

# create 14 directories lab-10 to lab-24 
# then touch one file in each directory file-lab-10.txt to  file-lab-24.txt
for (( i = 10; i <= 24; i++ )); do
  mkdir -p lab-$i
  touch lab-$i/file-$i.txt

done
