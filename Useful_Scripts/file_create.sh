#!/usr/bin/env bash

# This script instantly creates & chmods a new file type of your choosing.
# The primary reason I wrote this scrip:
# I got tired of always having to type..
# #!/usr/bin/env python3 or #!/bin/bash when writing scripts.

# In this example you can create a Python, Bash, .txt or .md 
# Give it a short and easy to type new name, and remove the .sh extension
# I named mine terp, as in, auto create & tell the interpreter what I want.
# Then move it to /usr/bin

# It works like this:
# 1. The file is created via the touch command
# 2. The the interpreter is assigned the enviroment to use. For example: #!/usr/bin/env python3 for Python3.
# 3. The script is given executable privilages
# 4. Then it is automatically opend in Vim and ready for writing

# Make sure the script is being executed with sudo privileges.
if [[ "${UID}" -ne 0 ]]
then
   echo 'Please run with sudo or as root.'
   exit 1
fi

# Create either a Python, Bash, .txt file or a markdown doc & open it with Vim
echo -e "Select a filetype to create: Python, Bash, txt, or md: \n1 = Python\n2 = Bash\n3 = txt\n4 = Markdown Doc File"
read sel

# Crete a Python file/script
if [[ $sel -eq 1 ]];
then
    echo "Name the Python script: "
    read NAME 
touch $NAME.py
echo "#!/usr/bin/env python3" > $NAME.py
chmod +x $NAME.py
vim $NAME.py

# Create a Bash Script
elif [[ $sel -eq 2 ]];
then
    echo "Name the Bash script: "
    read NAME
touch $NAME.sh
echo "#!/bin/bash" > $NAME.sh
chmod 755 $NAME.sh
vim $NAME.sh

# Create a .txt file
elif [[ $sel -eq 3 ]];
then
    echo "Name the text file: "
    read NAME
touch $NAME.txt
echo "# ASCII Text" > $NAME.txt
vim $NAME.txt

# Create a Markdown Documentation file
elif [[ $sel -eq 4 ]];
then
    echo "Name the Markdown Doc file: "
    read NAME
touch $NAME.md
echo "# Markdown Document" > $NAME.md
vim $NAME.md


exit 0
fi
