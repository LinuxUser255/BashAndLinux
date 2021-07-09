#!/bin/bash

# Stop typing ls | grep -i "search_pattern" everytime you want to search a directory.
# Search your directories with a super short & sweet cmmd.
# Create this bash script, rename it (remove the .sh), and put it in /usr/bin
# Then, create an alias for it in your .bashrc (I made it lll).
# Now,  inorder to search a directory, all you gotta do is tap the letter l three times,(lll), hit enter & BOOM! Off you go'

read -p 'ls | grep -i "' GREP  
echo ''
echo -e 'Search result(s):\n------------------\n'

ls | grep -i "${GREP}"
echo ''


