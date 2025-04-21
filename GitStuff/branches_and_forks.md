# Adding New Branches from the Original Repository to Your Fork

To add the `main` and `dev-testing` branches from the original repository to your fork and be able to submit pull requests to the `dev-testing` branch, you'll need to follow these steps:

## 1. Add the Original Repository as a Remote

First, you need to add the original repository as a remote in your local repository:

**File: Terminal Command**
```bash
git remote add upstream https://github.com/OpenSource-For-Freedom/HARDN.git
```

## 2. Fetch All Branches from the Original Repository

Next, fetch all branches from the original repository:

**File: Terminal Command**
```bash
git fetch upstream
```

## 3. Create Local Branches Tracking the Original Repository's Branches

Now, create local branches that track the original repository's branches:

**File: Terminal Command**
```bash
git checkout -b main upstream/main
```

**File: Terminal Command**
```bash
git checkout -b dev-testing upstream/dev-testing
```

## 4. Push These Branches to Your Fork

Push these branches to your fork on GitHub:

**File: Terminal Command**
```bash
git push -u origin main
```

**File: Terminal Command**
```bash
git push -u origin dev-testing
```

## 5. Making Changes and Creating Pull Requests

When you want to contribute changes to the original repository's `dev-testing` branch:

1. Make sure you're on your local `dev-testing` branch:

**File: Terminal Command**
```bash
git checkout dev-testing
```

2. Make sure your branch is up to date with the upstream:

**File: Terminal Command**
```bash
git pull upstream dev-testing
```

3. Create a new branch for your feature/fix:

**File: Terminal Command**
```bash
git checkout -b feature-name
```

4. Make your changes, commit them:

**File: Terminal Command**
```bash
git add .
git commit -m "Description of changes"
```

5. Push your feature branch to your fork:

**File: Terminal Command**
```bash
git push -u origin feature-name
```

6. Go to your fork on GitHub (https://github.com/LinuxUser255/HARDN)
7. You should see a prompt to create a pull request for your recently pushed branch
8. When creating the pull request, make sure to select:
   - Base repository: `OpenSource-For-Freedom/HARDN`
   - Base branch: `dev-testing`
   - Head repository: `LinuxUser255/HARDN`
   - Compare branch: `feature-name`

This workflow will allow you to contribute changes to the original repository's `dev-testing` branch while keeping your fork in sync with the upstream repository.
