#!/usr/bin/env bash

# Clean up / edit mp3 file names after doing yt-dlp downloads
# can add .mp4, or replace the .mp3 in the sed regex if you need

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
