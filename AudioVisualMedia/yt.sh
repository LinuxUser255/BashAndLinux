#!/bin/bash

# This script utilizes yt-dlp, (https://github.com/yt-dlp/yt-dlp), to allow you to quickly download either
# The highest quality version of the video and audio, or just the audio mp3 version.
# you can move this file into your path, /usr/bin, to enable downlaod ability from any directory
# do the following: Make it executable, rename it to remove the .sh file extension, then move it to /usr/bin
# chmod +x yt.sh
# mv yt.sh yt
# sudo mv yt -t /usr/bin
# now it is executable universal on your OS via the command line.
echo -e "You wanna download the video, or just the .mp3? \n1 = Video\n2 = mp3\n"
read sel

if [[ $sel -eq 1 ]];
then
    echo "Enter the URL: "
    read URL
yt-dlp -f bestvideo+bestaudio $URL

elif [[ $sel -eq 2 ]];
then
    echo "Enter the URL: "
    read URL
yt-dlp --extract-audio --audio-format mp3 $URL

exit 0
fi
