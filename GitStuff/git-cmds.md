
# Some basic git commands

1. in the root of the code base dir
do `git init`
this initializes it with git

then do `git add .`
and `git commit -m "Intitial Commit`

then you can do
`git remote add origin https://github.com/you/reponame.git`

Then retrieve your access token for the next step
`git push origin master`
enter your username and pw

And that should be it!

then create a new repo on your github
then

```shell

# Run these cmds in the root of the master or main branch

git init

git commit -m "Initial Commit"

# you will receive this url once you create the repo on github
git remote add origin  https://github.com/you/TheCodeBase.git

git push origin master
# enter your username and password at the prompt
# the password is your Personal Access Token

# And your code should now be up on github

```

## Pushing local changes to your GitHub repo

```bash
git add <file you are adding>

git commit -m "commit message"

git push

```

## Changing branches and stashing
```bash
git stash save "message what youre saving"

# Then switch branches

git checkout <branch name>

```


### some errors you might encounter
```bash
➜   git push
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master

To have this happen automatically for branches without a tracking
upstream, see 'push.autoSetupRemote' in 'git help config'.
```

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



## Pushing changes from a local repo, to a remote

To push changes from a local repository to GitHub, follow these steps:

1. **Initialize the repository (if not already initialized)**
    
    ```sh
    git init
    ```
    
    This initializes a new Git repository.
    
2. **Add a remote repository (if not already added)**
    
    ```sh
    git remote add origin <repository-URL>
    ```
    
    Example:
    
    ```sh
    git remote add origin https://github.com/username/repo.git
    ```
    
3. **Check the current branch**
    
    ```sh
    git branch
    ```
    
    If needed, create and switch to the desired branch:
    
    ```sh
    git checkout -b main
    ```
    
4. **Stage changes**
    
    ```sh
    git add .
    ```
    
    This stages all modified and new files.
    
5. **Commit changes**
    
    ```sh
    git commit -m "Your commit message"
    ```
    
    This records the changes in the local repository.
    
6. **Push changes to GitHub**
    
    ```sh
    git push origin main
    ```
    
    If pushing for the first time on a new branch:
    
    ```sh
    git push -u origin main
    ```
    
    The `-u` flag sets upstream tracking for the branch.
    

Would you like additional details on authentication (e.g., using SSH or personal access tokens)?




## Sync a repo with your local

### Fetch and pull the latest changes. (Updates the repo on your machine to latest version).


### 1. Fetch the latest changes from the remote repository:

```
git fetch origin
```



### 2. Pull the latest changes into your local repository:

```
git pull origin master
```


### Replace `master` with the name of the branch you want to sync (e.g., `main`, `dev`, etc.).


## Pyton vir env create
```bash

python3 -m venv path/to/your/virtualenv

source path/to/your/virtualenv/bin/activate

# creating a unique virt env name
python3 -m venv my_unique_name

# then source it like in the example above

# then to exit it
deactivate

```
