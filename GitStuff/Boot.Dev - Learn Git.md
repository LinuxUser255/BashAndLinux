[Learn Git - YouTube](https://youtu.be/rH3zE7VlIMs?si=CDpitnJC4x-P4Fnp)

## Table of Contents
- [Basic Commands](#basic-commands)
- [Branching](#branching)
- [Merging](#merging)
- [Merge Commits](#^merge-anchor)
- [Fast Forward Merge](#fast-forward-merge)
- [Rebase](#rebase)



 
## Basic Commands

```bash
git init

git add

git commit -m "A: add contents.md"

```


---

Here’s a practical cheat sheet of `git log` commands to help you explore your Git commit history effectively:

## git log commands

```bash
git log

git log -p  # shows differnces

git log --oneline

git log --oneline --graph --decorate --all

git log -n 5

git log --grep="login"

```


## Branching

![[git-branch-01.png]]

- Branch is a pointer to a commit
```bash
# check avai branches
git branch  

# create a new branch
git switch -c my_newbranch

```


![[git-branches-2.png]]


```bash
git --no-pager log -n 10 --oneline --parents

git log --oneline 

git log --oneline  --graph

git log --oneline | tee out

git log --decorate=no

git log --graph

git log --graph --oneline

git log --graph  --all

git log --oneline --decorate  --graph --parents

```


# Merging

```bash

A - B - C - E  main
         \ 
		 D      add_classics

```



![[git-log-graph-all.png]]



# Merge Commits ^merge-anchor



![[git-merge-commits.png]]


```bash
git merge add_classics

# edit the first line of the file - denote it withn F
F: Merge branch 'add_classics'

git log --oneline --decorate  --graph --parents
```

**these are the commits
![[git-merege-log.png]]



# Fast Forward Merge 
```TODO
1. delete add_classics branch
2. create new branch off main called update_titles (use git switch -c)
3. Add a commit to that branch thatg updates the titles.md and add ben button
4. run git log --oneline to ensure commit is present
```

```bash
# 1. delete add_classics branch
git branch -d add_classics

# 2. create new branch off main called update_titles (use git switch -c)
git switch -c update_titles

```

```bash
git log --oneline

65b3e74 (HEAD -> update_titles) G: editied titles.md curious
3537025 (main) F: Merge branch 'add_classics'
ce38c8c E: edited contents.md
3e31e9a D: added classics.csv in add_classics branch
e683348 C: add quotes
5cedc07 B: add titles
874fada A: add contents.md
```


```bash
git switch main


git oneline --graph

*   3537025 (HEAD -> main) F: Merge branch 'add_classics'
|\
| * 3e31e9a D: added classics.csv in add_classics branch
* | ce38c8c E: edited contents.md
|/
* e683348 C: add quotes
* 5cedc07 B: add titles
* 874fada A: add contents.md

```


```bash
git merge update_titles

➜  webflyx git:(main) git merge update_titles
Updating 3537025..65b3e74
Fast-forward
 out       | 6 ++++++
 titles.md | 1 +
 2 files changed, 7 insertions(+)
 create mode 100644 out
```

```bash
git log --oneline --decorate  --graph --parents

* 65b3e74 3537025 (HEAD -> main, update_titles) G: editied titles.md curious
*   3537025 ce38c8c 3e31e9a F: Merge branch 'add_classics'
|\
| * 3e31e9a e683348 D: added classics.csv in add_classics branch
* | ce38c8c e683348 E: edited contents.md
|/
* e683348 5cedc07 C: add quotes
* 5cedc07 874fada B: add titles
* 874fada A: add contents.md

```



# Rebase

**Allows a free of merge commit history**

![[git-rebase-01.png]]



![[git-rebase-02.png]]


Before Rebase
```bash

A - B - C    main
    \
     D - E   feature_branch


```

After Rebase
```bash
A - B - C          main
         \ 
          D - E   feature_branch

```

# Reset

# Remote


```bash


```


```bash


```

# GitHub

# Gitignore


# Fork

### Fork Workflow

**1. Fork the main repo**
**2. Clone down the forked repo to my env**
**3. Make changes**
**4. Push changes to the main branch of the forked repo**
**5. Open a PR with the changes from my fork, to the original repo**


**When I Clone down my fork I also add a second remote that I call upstream that points to the original repo**

```bash
git remote add upstream https://github.com/ORIGINAL-OWNER/ORIGINAL-REPOSITORY.git
```


this is because when the original repo changes, I can bring in their changes, and that
way, when I fix something, I know that I'm fixing on the latest version- this avoids conflicts during PRs
Double review your code on github, to catch mistakes befor you click the PR


```bash


```


```bash


```

# Reflog


# Merge Conflicts

is when two commits modify the same line and git is unable to auto decide which change to keep
and which to discard

```bash

       C      Feature
     /
    A - B     Main

```



