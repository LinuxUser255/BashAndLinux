#!/bin/bash

read -p 'Enter URL for mp3 extraction: '  URL

# the yt-dlp command for mp3 extraction
yt-dlp -x --audio-format mp3  ${URL}
