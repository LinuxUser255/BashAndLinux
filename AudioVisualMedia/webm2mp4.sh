#!/usr/bin/env bash

# ffmpeg -i input.webm -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 128k output.mp4
# This ffmpeg command converts a .webm video file to a standard .mp4 file using the libx264 codec for video, 
# aac codec for audio, and a CRF value of 22. 
# The preset is set to 'slow' for higher quality encoding, 
# and the audio bitrate is set to 128 kbps.
echo ""
printf "\e[1;31mConvert a .webm video to a .mp4\e[0m"
echo ""
read -p 'Enter the file to convert: ' FILE 
echo ""
read -p 'Name the converted file: ' OUTPUT_FILE

ffmpeg -i "${FILE}" -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 128k "${OUTPUT_FILE}.mp4"


echo ""
