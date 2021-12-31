#!/usr/bin/env bash

# This script is for when you need to assign many field values in the awk brackets.
# Example: awk '{$1,$2,$3}' doc.txt  
# This enables you to print as many values as needed, then copy-paste them into the awk brackets.
# Alternatively, it can be run as a One-Liner in the command line:
# for i in  {1..20}; printf  $i"\t" | sed "s/\s/,$/g;"
# 0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$
for i in {0..20}; do
	printf $i"\t" | sed "s/\s/,$/g;"

done
