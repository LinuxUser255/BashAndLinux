# REGULAR EXPRESSIONS

## sed

```
. any one char
* match any number of previous (also 0)
+  match any number of previous
$ end of line
^ beginning of line
\S any non-whitespace char
\s any white-space char
? optional
[a-z] any lower case letter
[A-Z] any UPPER CASE letter
\ escape something
[A-Za-Z] any letter regardless of caps
[0-9] any number

```

## Examples of `sed`

## Sub and replace lower case c with capital Cs in a text file
```bash
sed is a stream editor

sed "s/c/C/g" file.txt

the g runs the sub cmds more than once

## Make all lower case into UPPER case
```bash

sed 's/\([a-z]\)/\U\1/g'

sed 's/.*/\U&/'
```



## Make all UPPER into lower
```bash

sed 's/\([A-Z]\)/\l\1/g'

sed 's/.*/\L&/'
```


###  Replace the patern of something
**such as replacing a comment**

## the period stands for any char, and the astrix says whatever was previously typed
**say any number of those, (like a wild card)**

### This command will remove every #
```bash

sed "s/#.*//g" file

# to remove spaces
sed "s/\s*#.*//g" file.txt

# You can concatonate sed s
# (and the d at the end is to delete blank lines)
# (the g is to replace all instances of the targeted char)


sed "s/\s*#.*//g;s/c/C/g" file.txt

sed "s/\s*#.*//g; /cf/ d" file.txt

# Goal: Use a for loop to print a dollar sign prefixed
# to a string of numbers separated by commas:
for i in {0..20}; printf $i"\t" | sed "s/\s/,$/g;"

# result:
0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$

```

```bash
# GOAL:
# ISOLATE THE PASSWORDS WITH JUST ONE COMMAND, USING ANY COMBO OF AWK & SED
# And REMOVE ALL OTHER CHARS.

========================================//       ==========
HACKED By: : ///L5C4S\\\               =// 21/02/2015     =
========================================// 02:24 ==========
abarrene@umw.edu:antonio4
abedur.rasul@yahoo.com:a1b1c1d1
abellanger@gt.rr.com:mom7227691
abby@emery.co.uk:maemae23
abhayvc@hotmail.com:abhay190479
abeandryan@centurytel.net:malachi1
aaronsouthern@gmail.com:modem916
```


```bash
# awk & sed
awk '{print $1}' emsandpws.txt | sed "s/=.*//g;s/\S*://g;s/HACKED.*//g; /^$/ d"

# just sed
sed "s/=.*//g;s/\S*://g;s/HACKED.*//g;s/ISOLATE.*//g;s/And.*//g;s/\s.*//g; /^$/ d" emails.txt

```
