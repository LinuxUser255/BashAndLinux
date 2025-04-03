
## Interesting Shell Scripting from 
[Dylan Araps Pure Bash Bible](https://github.com/dylanaraps/pure-bash-bible)

# Short functions
```bash
#!/usr/bin/env bash

# Short function Example: Normal method
f(){ echo hi;}


# Using a subshell
f()(echo hi)

# Using arithmetic
# This can be used to assign integer values.
# Example: f a=1
#          f a++
f()(($1))

# Using tests, loops etc.
# NOTE: ‘while’, ‘until’, ‘case’, ‘(())’, ‘[[]]’ can also be used.
f()if true; then echo "$1"; fi

f()for i in "$@"; do echo "$i"; done


f()for i in "$@"; do echo "$i"; done


fun() {
    for i in "$@"; do
        echo "$i"
    done
}

fun arg1 arg2 arg3
```

## Arrarys & Functions
```bash
#!/usr/bin/env bash

remove_array_dups() {
    # Usage: remove_array_dups "array"
    declare -A tmp_array

    for i in "$@"; do
        [[ $i ]] && IFS=" " tmp_array["${i:- }"]=1
    done

    printf '%s\n' "${!tmp_array[@]}"
}

remove_array_dups
```

## Cycle through an Arrary
```bash
#!/usr/bin/env bash

arr=(
    a
    b
    c
    d
)

cycle() {
    printf '%s ' "${arr[${i:=0}]}"
    ((i=i>=${#arr[@]}-1?0:++i))
}

cycle

```





