
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

