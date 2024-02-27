#!/bin/bash

# Instantly Create & chmod a new file type of your choosing.
# In this example you can create a Python, Bash, Go, .txt or .md
# Give it a short and easy to type new name, and remove the .sh extension
# I named mine terp, as in, auto create & tell the interpreter what I want.
# Then move it to /usr/bin

# It works like this:
# 1. The file is created via the touch command
# 2. The the interpreter is assigned the enviroment to use. For example: #!/usr/bin/env python3 for Python3.
# 3. The script is given executable privilages
# 4. Then it is automatically opend in Vim and ready for writing


# Create either a Python, Bash, Go, .txt file or a markdown doc & open it with NeoVim
echo -e "Select a filetype to create: Python, Bash, Go, txt, or md: \n1 = Python\n2 = Bash\n3 = Go\n4 = txt\n5 = Markdown Doc File"
read sel


# 1. Crete a Python file/script
if [[ $sel -eq 1 ]];
then
    echo "Name the Python script: "
    read NAME
touch $NAME.py
echo "#!/usr/bin/env python3" > $NAME.py
chmod +x $NAME.py
nvim $NAME.py


# 2. Create a Bash Script
elif [[ $sel -eq 2 ]];
then
    echo "Name the Bash script: "
    read NAME
touch $NAME.sh
echo "#!/bin/bash" > $NAME.sh
chmod 755 $NAME.sh
nvim $NAME.sh


# 3. Create a .Go file
elif [[ $sel -eq 3 ]];
then
    echo "Name the Go script: "
    read NAME

touch $NAME.go
echo "package main" > $NAME.go
echo "" >> $NAME.go
echo 'import "fmt"' >> $NAME.go
echo "" >> $NAME.go
echo "func main(){" >> $NAME.go
echo "// put code here" >> $NAME.go
echo "" >> $NAME.go
echo "}" >> $NAME.go
echo "" >> $NAME.go
echo "" >> $NAME.go
nvim $NAME.go


# 4. Create a .txt file
elif [[ $sel -eq 4 ]];
then
    echo "Name the text file: "
    read NAME
touch $NAME.txt
echo "# Title" > $NAME.txt
nvim $NAME.txt


# 5. Create a Markdown Documentation file
elif [[ $sel -eq 5 ]];
then
    echo "Name the Markdown Doc file: "
    read NAME
touch $NAME.md
echo "# Title" > $NAME.md
nvim $NAME.md

exit 0
fi

