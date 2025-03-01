
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
