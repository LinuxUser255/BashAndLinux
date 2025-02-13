#!/usr/bin/env bash

# Instantly Create & chmod a new file type of your choosing.
# This script allows you to create Python, Shell, Go, txt, Markdown, Flask, C++, or C files.
# The file is created, optionally populated with boilerplate, made executable (if needed), and opened in NeoVim.

echo -e "Select a file type to create: \n1 = Python\n2 = Shell Script\n3 = Go\n4 = txt\n5 = Markdown\n6 = Flask\n7 = C++\n8 = C"
read -r sel

echo "Enter the file name (without extension): "
read -r NAME

case $sel in
    1)  # Python script
        touch "$NAME.py"
        cat <<EOF > "$NAME.py"
#!/usr/bin/env python3

def main():
    # Main function code here
    pass

if __name__ == "__main__":
    main()
EOF
        chmod +x "$NAME.py"
        nvim "$NAME.py"
        ;;

    2)  # Shell script
        touch "$NAME.sh"
        echo "#!/usr/bin/env bash" > "$NAME.sh"
        chmod +x "$NAME.sh"
        nvim "$NAME.sh"
        ;;

    3)  # Go file
        touch "$NAME.go"
        cat <<EOF > "$NAME.go"
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
EOF
        nvim "$NAME.go"
        ;;

    4)  # Text file
        touch "$NAME.txt"
        echo "# Title" > "$NAME.txt"
        nvim "$NAME.txt"
        ;;

    5)  # Markdown file
        touch "$NAME.md"
        echo "# Title" > "$NAME.md"
        nvim "$NAME.md"
        ;;

    6)  # Flask Python script
        touch "$NAME.py"
        cat <<EOF > "$NAME.py"
#!/usr/bin/env python3

from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'Home'

if __name__ == '__main__':
    app.run()
EOF
        chmod +x "$NAME.py"
        nvim "$NAME.py"
        ;;

    7)  # C++ file
        touch "$NAME.cpp"
        cat <<EOF > "$NAME.cpp"
#include <iostream>

using namespace std;

int main() {
    cout << "Hello, World!" << endl;
    return 0;
}
EOF
        nvim "$NAME.cpp"
        ;;

    8)  # C file
        touch "$NAME.c"
        cat <<EOF > "$NAME.c"
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}
EOF
        nvim "$NAME.c"
        ;;

    *)  # Invalid selection
        echo "Invalid selection. Please choose a number between 1 and 8."
        exit 1
        ;;
esac

exit 0
