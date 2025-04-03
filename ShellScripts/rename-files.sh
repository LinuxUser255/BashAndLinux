#!/usr/bin/env bash

# What this script does:
# Uses sed to clean up / edit mp3 file names after doing yt-dlp downloads

# Example list of songs - Before
#----------------------------------------------------------------
# 'SKELER - Never True (Music Video) [dnIZsRb96JY].mp3'
# 'Snow Banks - Sink or Swim (barnacle boi Remix) [Wave] [BwBr2B2AilM].mp3'
# 'Statue Of God - Solo Leveling #LXNGVX @LXNGVX [FT0WYkHghJI].mp3'
# 'STROBE [p7CQjzUMIfE].mp3'

# List After cleanup edit script:
#------------------------------------------------------------------
# SKELER-Never-True-Music-Video.mp3
# Snow-Banks-Sink-or-Swim-barnacle-boi-Remix-Wave.mp3
# Statue-Of-God-Solo-Leveling-LXNGVX-LXNGVX.mp3
# STROBE.mp3
# Sxntury-Smoked-Glock-ft-ShamanStems-Night-Drive-6.mp3

#-------------------------------------------------------------------
# Directions:
# You can add .mp4, or replace the .mp3 in the sed regex if you need
# run it against the dir containing the files. like this:

# ./rename_files.sh /path/to/your/directory
# or if your in the parent dir, it's like this:

# ./rename_files.sh MyPlaylist
# where 'MyPlaylist' is the name of a directory containing mp3s

# Check if a directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIR="$1"

# Loop through all files in the directory
for file in "$DIR"/*; do
    # Skip if it's a directory
    [ -d "$file" ] && continue

    # Extract the filename only (remove path)
    filename=$(basename -- "$file")

    # Apply regex to transform filename
    new_filename=$(echo "$filename" | sed -E "s/^'|'$//g; \
        s/\[[^]]*\]//g; \
        s/\(([^)]*)\)/\1/g; \
        s/[|｜]/-/g; \
        s/—/-/g; \
        s/,/-/g; \
        s/[[:space:]]+/-/g; \
        s/-+/-/g; \
        s/^-|-$//g; \
        s/-+\.mp3/.mp3/")  # Cleans up trailing hyphens before .mp3

    # Rename the file if the name has changed
    if [[ "$filename" != "$new_filename" ]]; then
        mv "$file" "$DIR/$new_filename"
        echo "Renamed: $filename → $new_filename"
    fi
done

echo "All files in '$DIR' have been processed."
