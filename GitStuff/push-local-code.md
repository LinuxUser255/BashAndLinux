
## To push a code-base/local repo to github

## Create the repo on GitHub, then,

1. in the root of the code base dir
do `git init`
this initializes it with git

2. then do `git add .`
and `git commit -m "Intitial Commit`

3. then you can do 
`git remote add origin https://github.com/you/reponame.git`

4. Then retrieve your access token for the next step
`git push origin master`
enter your username and pw

And that should be it!


### Commands
```shell
/TheCodeBase

git init

git commit -m "Initial Commit"

# you will receive this url once you create the repo on github
git remote add origin  https://github.com/you/TheCodeBase.git

git push origin master
# enter your username and password at the prompt
# the password is your Personal Access Token

# And your code should now be up on github
```
<br>

### Some errors you might encounter
```bash

➜   git push
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master

To have this happen automatically for branches without a tracking
upstream, see 'push.autoSetupRemote' in 'git help config'.
```
<br>

### Solution: use the `--set-upstream` flag
**Then enter your login creds to complete it**
```bash

➜   git push --set-upstream origin master
Username for 'https://github.com': your_username_here
Password for 'https://linux@github.com': 
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 24 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (7/7), 46.30 KiB | 23.15 MiB/s, done.
Total 7 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/LinuxUser255/ReactFast.git
   6d3c5f3..f5ec179  master -> master
branch 'master' set up to track 'origin/master'.

```





