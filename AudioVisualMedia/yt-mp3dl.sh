#!/bin/bash

# This script utilizes yt-dlp, (https://github.com/yt-dlp/yt-dlp), 
# to allow you to quickly download just the mp3 version of a video
echo " Download the mp3 version"
echo ""
echo "Enter the URL: "
read URL
yt-dlp --extract-audio --audio-format mp3 $URL

exit 0
fi
