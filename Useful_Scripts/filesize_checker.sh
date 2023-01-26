#!/bin/bash

# This script can be used to check the size of files & directories.

# Usage: 
# Check a file
# ./filesize_checker.sh <filename> 
#        
# Check a directory
# ./filesize_checker.sh <directory name>

# Take user input for the file or directory to be checked.
read -p "file_dir: " FILE
 
 
# word count in bytes of the selected file
selection_one() {
    clear   
    wc -c $FILE
}


# du -sh dir check size of the specified directory including its sub directory
selection_two() {
    clear
    du -sh $FILE
}


# ls -lh filename check size of the specified file
selection_three() {
    clear
    ls -lh $FILE
}


# ls -lh * check size of all the files in the current directory
selection_four() {
    clear
    ls -lh * $FILE
}


# ls -alh *	check size of all the files including hidden files in the current directory
selection_five() {
    clear
    ls -alh * $FILE
}


# ls -alh dir/	check size of all the files including hidden files in the ‘dir’ directory
selection_six() {
    clear
    ls -alh $FILE
}


function menu() {
    clear
    echo
    echo -e "\t\t\tCheck file size\n"
    echo -e "\t1. Check size of the specified file using wc -c "
    echo -e "\t2. Check size of a specific Directory and the sub-dirs."
    echo -e "\t3. Check size of specified file usinf ls -lh"
    echo -e "\t4. Check size of all the files in the current directory"
    echo -e "\t5. Check size of all the files including hidden files in the current directory"
    echo -e "\t6. Check size of all the files including hidden files in the ‘dir’ directory"
    echo -e "\t0. Exit.\n\n"
    echo -en "\t\tSelect action: "
    read -n 1 selection
}

while [ 1 ] 
do 
    menu
    case $selection in 
    0)
        break ;;
    1)
        selection_one ;;
    2)
        selection_two ;;
    3)
        selection_three ;;
    4)
        selection_four ;;
    5)
        selection_five ;;
    6)
        selection_six ;;
    *)
       clear
       echo "invalid selection";;
    esac

    echo -en "\n\n\t\t\tHit any key to continue."
    read -n 1 line
    
done
#clear
