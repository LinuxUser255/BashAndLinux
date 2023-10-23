#!/usr/bin/env bash

echo ""
printf "\e[1;31mConvert a .webm video to a .mp4\e[0m"
echo ""
read -p 'Enter the file to convert: ' FILE 
echo ""
read -p 'Name the converted file: ' OUTPUT_FILE

# Command template for this script
# ffmpeg -i input.webm -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 128k output.mp4
ffmpeg -i "${FILE}" -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 128k "${OUTPUT_FILE}.mp4"

echo ""
