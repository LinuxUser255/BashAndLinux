---
path: "/exercise-6"
title: "Advanced Motions"
order: "75A"
section: "Misc Content"
description: "Motions 201"
---


Here is another vim motion guide, that is more of a cheat sheet, that a practice file
However, it does have some sections with pseudo code that explain some neat ways to edit.
https://github.com/LinuxUser255/BashAndLinux/blob/main/Vim_Stuff/motions_explained.md



// 1. cursor on function foo
// 2. f {   jumps to the {oddly .."}
// 3. ya{ Copies everything inside the {}, including the {}
// 4. jump down to   (bar: number)
// 5. cursor on the word number
// 6. viw , selects the word
// 7. p to paste/prepend the {contents} over it

// and press vi(  .. Selects everything inside the ()
// and press vi{  .. Selects everything inside the {}

// and press va{  .. Selects everything & around  the {}
// and press ya{  .. Copies everything inside the {}, including the {}
// ci { jumps inside the squirley brace cuts out all the text, in insert mode
/ yi{ copies everything inside the squirley braces
/ yi( copies everything inside the parentheses



### Change
`c` is a powerful motion.  You use it just like `d` but at the end of the
motion you are ejected from `NORMAL` and into `INSERT`.

So if you wished to delete a word and then type in a new word, `c` is a great
abit to form.

Lets see the difference

// dd this line
// cc this line

### Horizontal Movement
Lets learn about!: `_`, `0`, `$`, `D`, `C`, `S`, `f`, `,`, `;`, `t`, `F`, and `T`

// How would we move around on the line with "contents"
// press f, then the character you want to jump on

// jump to each b, use ; to go forward, and comma to go backwards
// press f: bar bar bar bar bar bar bar bar

// press f( to jump on the parentheses
// press t( to jump to the first parentheses, but not on it.
// to repeat it, use , and ;
// comma goes backwars semicolon goes forward - that was ft;;;; and , to go back to the previous t
// try jumping to the t in (true), then the (
if (true) {
    contents conTenTs contenTS
}

if (true) {
    contents conTenTs contenTS
}

if (true) {
    contents conTenTs contenTS
}

if (true) {
    contents conTenTs contenTS
}




### Vertical Movement
#### Core movement
Rely on relative jumps.  Get good at them.

If you get NeoVim, try VimBeGood

#### { and }
We know about search.  That is a vertical movement, but its really specific.

First lets talk `{` and `}`

ContiguousCode
ContiguousCode
    ContiguousCode
    ContiguousCode
        ContiguousCode
    ContiguousCode
ContiguousCode

ContiguousCode
ContiguousCode
    ContiguousCode
    ContiguousCode
        ContiguousCode
    ContiguousCode
ContiguousCode

##### Benefits?  Class chat
This next one is a bit odd

#### Ctrl+u/d
So lets do another type of navigation.

Try pressing `<C-d>`

.
.
1 ContiguousCode
2 ContiguousCode
3 ContiguousCode
4 ContiguousCode
5 ContiguousCode
6 ContiguousCode
7 ContiguousCode
 .




Copy-pasting
ContiguousCode
1. go into normal mode
2. put the cursor somewhere along the paragraph or codeblock
3. then hit leader y
this will prep the clipboard to copy text
4. then hit ap (this will select and copy the paragraph or codeblock
5. and paste it  below, or where ever you place the cursor.


.
1 ContiguousCode
2 ContiguousCode
3 ContiguousCode
4 ContiguousCode
5 ContiguousCode
6 ContiguousCode
7 ContiguousCode


8 ContiguousCode
9 ContiguousCode
10 ContiguousCode
11 ContiguousCode


.
1 ContiguousCode
2 ContiguousCode
3 ContiguousCode
4 ContiguousCode
5 ContiguousCode
6 ContiguousCode
7 ContiguousCode
 .

.

.

.

copy the entire contents of a file in the clipboard.
noremap<leader>Y gg"yG

.
.

.

.

.


##### Benefits?  Class chat

#### [m / ]m and [M / ]M
This will move by "function".  It works pretty well in c languages.

Move your cusor to this line and press `]m`.  Try moving back and forth and try
the uppercase version as well.

if (foo) {
    some content
    some content
    some content
    some content
    function bar() {
        some other content
        some other content
        some other content
        some other content
    }
    function baz() {
        other content
        other content
        other content
        other content
    }
}

##### Benefits?

#### %
Ok,.... soo this isn't a pure vertical motion.  It actually is a pair jumper

if (true) {
    content
    const a = [
        content,
        content,
        content,
    ]

    "content"

    content
    content
}

Lets combine it with a motion.  Delete the `const a =...` statement.

### Get zany...
Lets look at the following statement, what are some ways you can delete the
contents of the if statement?

if (true) {
    line1
    line2
    line3
    line4
    line5
}

I was hoping to hear `f{V%D`.  That is just so sexy. `d4j` is ok.  Relative
jump, well done..  `5dd` meh.  I would glad hand like a politician with `dd dd
dd dd dd`.  Just say mean things behind your back.

So lets try again.. but I spiced it up.

if (true) {
    line1
    // Some distance
    line2
    line3

    line4
    line5
}

First, place your cursor _in_ the if statement.  Where ever you want.  Type `di{`

i = inside

#### Class Discussion
What _other_ letter do you think you could try other than `i`?

.
.
.
.
.
.
.
use `<C-d>` to go down...
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.

// TODO: make a meme -- aliens..
Yes, `a` is the other.  I have never heard a great reason why, but just deal
with it.

so lets try again. try `da{`

if (true) {
    line1
    // Some distance
    line2
    line3

    line4
    line5
}

well shoot...

#### Class Discussion
Lets solve this together

if (true) {
    line1
    // Some distance
    line2
    line3

    line4
    line5
}

.
.
.
.
.
.
.
.
.
.

For those that couldn't wait or got the answer. `va{Vd`

#### Use YOUR SUPER POWERS
lets redo the previous exercise except copy from one if statement and override
lets redo the previous exercise except copy from one if statement and override
the next if statement.  How would we go about this?
the next if statement.  How would we go about this?

* DO

yi{  yank between the {}
10j  jump down 10 lines
vi{ highlight everything between the {} in the next block of code
p   then paste the previous block of code over the one you are replacing



if (true) {
    line1
    // Some distance
    line2
    line3

    line4
    line5
}

if (true) {
    replace_me_1
    // Some distance
    replace_me_2
    replace_me_3

    replace_me_4
    replace_me_5
}



foo
bar
baz


foo
foo

baz


foo
bar
baz

replace_me_2
replace_me_3
replace_me_2


## some horizontal movements

// press f, then the character you want to jump on

// jump to each b, use ; to go forward, and comma to go backwards
// press f: bar bar bar bar bar bar bar bar

// press f( to jump on the parentheses
// press t( to jump to the first parentheses, but not on it.

// to repeat it, use , and ;
// comma goes backwars semicolon goes forward - that was ft;;;; and , to go back to the previous t

//  To Select everything inside () and {} place the cursor inside the (),

// and press vi(  .. Selects everything inside the ()
// and press vi{  .. Selects everything inside the {}

// and press va{  .. Selects everything & around  the {}
// and press ya{  .. Copies everything inside the {}, including the {}

// in the first function, copy  {oddly: "long" | "type", but: "hey" | "this" | "is" | number}
// and paste over number, in the second function
// 1. cursor on function foo
// 2. f {   jumps to the {oddly .."}
// 3. ya{ Copies everything inside the {}, including the {}
// 4. jump down to   (bar: number)
// 5. cursor on the word number
// 6. viw , selects the word
// 7. p to paste/prepend the {contents} over it
```rust

function foo(blaz: {oddly: "long" | "type", but: "hey" | "this" | "is" | number}) {

    let mut receive_rx = conn.player_to_game().expect("to exist");

}
function new_fn(bar: number) {

      // some other comment
      let mut receive_rx = conn.player_to_game().expect("to exist");
}
```

// -------- //

```rust

// 1. jump forward ya{ and viw
function foo(blaz: {oddly: "long" | "type", but: "hey" | "this" | "is" | number}) {
    // ...
}

function new_fn(bar: number) {
    // ...
}
```

// Goal: want to use 'some::long::type' as the return value
// cursor on the < after Result<
// Jump back to the ) F)
// Then yiW  selected all Contiguous text  some::long::type)
// Jump forward to the < and paste in the Contiguous text
// then replace the ) with a >
```rust

// before
fn some_function(arg: some::long::type) -> Result< {

// after
fn some_function(arg: some::long::type) -> Result<some::long::type> {

}

fn main() {
    //
    if true {
        println!("asdf");
    } else {
        println!("qwerty");
    }

}

```


// separator

```rust

fn some_function(arg: some::long::type) -> Result< {
}

fn main() {
    //
    if true {
        println!("asdf");
    } else {
        println!("qwerty");
    }

}

```









```rust
//

async fn main() -> Result<()>
    warn!("starting the server on {}", args.port);
    let mut player_id = 0;

    while let Ok((stream, _)) = server.accept().await {
        let mut conn = EcpConnection::new(player_id, stream);
        player_id += 1;

        // vim vertical motions. Place cursor on the = and do d$,
        // which will delete from your cursor to the end of the line
        let mut receive_rx = conn.player_to_game().expect("to exist");

        // move to specific chars.
        // jump from the = to the opening ( f(
        let mut receive_rx = conn.player_to_game().expect("to exist");
        // jump backwards is F then the character
        // cursor on () , and jump back to the =
        // hit F = to jump to the selcted char
        let mut receive_rx = conn.player_to_game().expect("to exist");

        // hit t and then the char, and you will jump up to, but not on that character
        // cursor anywhere, and hit t ( jump up to the ( opening paranthesis
        let mut receive_rx = conn.player_to_game().expect("to exist");


        let mut receive_rx = conn.player_to_game().expect("to exist");

        let mut receive_rx = conn.player_to_game().expect("to exist");

        let mut receive_rx = conn.player_to_game().expect("to exist");

        let mut receive_rx = conn.player_to_game().expect("to exist");

        let mut receive_rx = conn.player_to_game().expect("to exist");




```


```rust
//

async fn main() -> Result<()>
    warn!("starting the server on {}", args.port);
    let mut player_id = 0;

    while let Ok((stream, _)) = server.accept().await {
        let mut conn = EcpConnection::new(player_id, stream);
        player_id += 1;

let mut receive_rx = conn.player_to_game().expect("to exist");

let mut receive_rx = conn.player_to_game().expect("to exist");

let mut receive_rx = conn.player_to_game().expect("to exist");

```







### practice on python code
// 1. cursor on function foo
// 2. f {   jumps to the {oddly .."}
// 3. ya{ Copies everything inside the {}, including the {}
// 4. jump down to   (bar: number)
// 5. cursor on the word number
// 6. viw , selects the word
// 7. p to paste/prepend the {contents} over it

// and press vi(  .. Selects everything inside the ()
// and press vi{  .. Selects everything inside the {}

// and press va{  .. Selects everything & around  the {}
// and press ya{  .. Copies everything inside the {}, including the {}
// ci { jumps inside the squirley brace cuts out all the text, in insert mode
/ yi{ copies everything inside the squirley braces
/ yi( copies everything inside the parentheses
```python

def lambda_example() -> None:
    print()
    add_function: Callable[[float, float], float] = lambda a, b: a + b
    print(f'This is a Lambda function example: {add_function(2, 3)}')

def lambda_example() -> None:
    print()
    add_function: Callable[[float, float], float] = lambda a, b: a + b
    print(f'This is a Lambda function example: {add_function(2, 3)}')

def lambda_example() -> None:
    print()
    add_function: Callable[[float, float], float] = lambda a, b: a + b
    print(f'This is a Lambda function example: {add_function(2, 3)}')
```


// 1. cursor on function foo
// 2. f {   jumps to the {oddly .."}
// 3. ya{ Copies everything inside the {}, including the {}
// 4. jump down to   (bar: number)
// 5. cursor on the word number
// 6. viw , selects the word
// 7. p to paste/prepend the {contents} over it

// and press vi(  .. Selects everything inside the ()
// and press vi{  .. Selects everything inside the {}

// and press va{  .. Selects everything & around  the {}
// and press ya{  .. Copies everything inside the {}, including the {}
// ci { jumps inside the squirley brace cuts out all the text, in insert mode
/ yi{ copies everything inside the squirley braces
/ yi( copies everything inside the parentheses


first_set: Set[int] = {1, 2, 3, 4, 5}

```python

def example_of_a_set() -> None:
    first_set: Set[int] = {1, 2, 3, 4, 5}
    # delete all numbers inside the {}
    # and press vi{  .. Selects everything inside the {}
    # then press d
    second_set: Set[int] = {6, 7, 8}
    second_set: Set[int] = {6, 7, 8}
    second_set: Set[int] = {6, 7, 8}
    first__set.add(6)
    first__set.add(6)

    second_set: Set[int] = {6, 7, 8}
    second_set: Set[int] = {6, 7, 8}
    # delete the remaining  second_set
    # hit 3 d enter. or V jj d
    second_set: Set[int] = {6, 7, 8}
    second_set: Set[int] = {6, 7, 8}
    second_set: Set[int] = {6, 7, 8}
    first__set.add(6)
    first__set.add(6)
    first__set.add(6)
    second_set.add(6)
    print(f'This is an example of a set: {example_set}')
    print()





def example_of_a_dict() -> None:
    vehicles: Dict[str, str] = {"car": "toyota", "motorcycle": "honda", "truck": "ford"}
    print(f'Example of a dictionary: {vehicles}')
    print()


# basic lambda function example
def lambda_example() -> None:
    print()
    add_function: Callable[[float, float], float] = lambda a, b: a + b
    sub_function: Callable[[foo, bar], float] = lambda a, b: a + b
    print(f'This is a Lambda function example: {add_function(2, 3)}')
    print()


def for_loop_example() -> None:
    print("For loop example")
    for i in range(5):
        print(f'Current number is: {i}')
        print("The counting begins with 0")


def while_loop_example() -> None:
    print("While loop example\n")
    i: int = 0
    while i < 5:
        print(f'Current number is: {i}')
        i += 1
        print("The counting begins with 0")


# control flow examples
def control_flow() -> None:
    print("Control flow examples\n")
    user_input: str = 'hello'

    if user_input == 'hello':
        print('Bot: Hello, user!')
    elif user_input == 'how are you?':
        print('Bot: I am doing well, thank you!')
    else:
        print('Bot: I don\'t understand that')



def main() -> None:
    example_of_a_set()
    example_of_a_dict()
    for_loop_example()
    lambda_example()
    while_loop_example()
    control_flow_user_input()


if __name__=='__main__':
    main()

```
