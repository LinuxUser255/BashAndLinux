#!/usr/bin/env bash

# Convert a .webm video file to either an mp3 audio file or an mp4 video file.
echo ""
printf "\e[1;31mConvert a webm to mp3 or mp4\e[0m\n"
echo -e "Press \n1 for mp3 \n2 for mp4"
read sel

# convert to mp3
if [[ $sel -eq 1 ]];
then
    read -p 'Enter the webm to convert to mp3: ' INPUT_FILE 
    read -p 'Assign a name the converted file: ' OUTPUT_FILE_NAME
ffmpeg -i "${INPUT_FILE}" -vn -ab 128k -ar 44100 -y "${OUTPUT_FILE_NAME}.mp3"


# convert to mp4
elif [[ $sel -eq 2 ]];
then
    read -p 'Enter the webm file to convert to mp4: ' INPUT_FILE 
    read -p 'Assign a name the converted file: ' OUTPUT_FILE_NAME
ffmpeg -i "${INPUT_FILE}" -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 128k "${OUTPUT_FILE_NAME}.mp4"


exit 0
fi
