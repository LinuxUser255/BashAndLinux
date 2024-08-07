

### Remove all blank lines
```
egrep -v "^[[:space:]]*$" old.txt > new.txt
```

###  Remove duplicates

```
awk '!(count[$0]++)' old.txt > new.txt
```



## Add New lines 
```
The "nl" command is dedicated for adding line numbers to a file.
cat -n file.txt

nl file.txt > file2.txt

align width
$ nl -w2 file.txt

cat -n file.txt
```



# Sort by alphabetical order
```
sort old.txt | uniq > new.txt
```


RANDOM AWK COMMANDS
----------------------------------------------------------------
```
awk '{print $2,$5}' ScanResults | grep -i up

assign a starting line to begin displaying
awk 'BEGIN{i=5} /.*/{printf "%d.% s\n",i,$0; i++}' file.txt
```


# Remove duplicates
```
awk '!(count[$0]++)' old.txt > new.txt
```

### Sort by length
```
awk '{print length, $0}' old.txt | sort -n | cut -d " " -f2- > new.txt
```

### assign a starting line to begin displaying
```
awk 'BEGIN{i=5} /.*/{printf "%d.% s\n",i,$0; i++}' file.txt
```


# Use AWK to find things in a file: 
```
awk '/pttrnmatch /, /ptttrnmatch /' file.txt
```


### RANDOM GREP COMMANDS
```
grep -i keywrd  file.txt
```

### Remove all blank lines
```
egrep -v "^[[:space:]]*$" old.txt > new.txt
```

 

### Bash Script and commands for text file editing
```
awk '!(count[$0]++)' "text.txt" > ${text.txt}-new
```

```
[ $? -eq 0 ] && { echo "Duplicates have been removed, view new file at ${f_path}-new"; exit 0; }
;;

2) read -p "Enter path to file: " f_path
awk '{print length, $0}' "$f_path" | sort -n | cut -d " " -f2- > ${f_path}-new
[ $? -eq 0 ] && { echo "File has been sorted by length at ${f_path}-new"; exit 0; }
;;

3) read -p "Enter path to file: " f_path
sort "$f_path" | uniq > ${f_path}-new
[ $? -eq 0 ] && { echo "File has been sorted by alphabetical order at ${f_path}-new"; exit 0; }
;;

4) read -p "Enter path to file: " f_path
egrep -v "^[[:space:]]*$" "$f_path" > ${f_path}-new
[ $? -eq 0 ] && { echo "File has been removed of all blank lines at ${f_path}-new"; exit 0; }
;;

q) echo "Peace"
;;

*) echo "I do not understand"
;;
```
