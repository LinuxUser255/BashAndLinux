#!/bin/bash

# Create 30 directories in the format sec_01 to sec_30

# make dirs sec_01 to sec_09 using a one-liner for loop
# for i in {1..9}; mkdir sec_0${i}

# make dirs sec_10 to sec_20
# for i in {10..19}; mkdir sec_${i}

# make a series of directories starting with sec_10 to sec_30
# for i in {20..30}; mkdir sec_${i}

# combine all in one script:
for ((i = 1 ; i < 9 ; i++)); do
    mkdir sec_0${i}

done


for ((i = 10 ; i < 19 ; i++)); do
    mkdir sec_${i}

done


for ((i = 20 ; i < 30 ; i++)); do
    mkdir sec_${i}

done
