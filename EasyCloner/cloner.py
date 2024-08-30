#!/usr/bin/env python3

# python script that iterates over a list of git repositories, in repos.txt, and git clone every one

import os

# Read repositories from repos.txt
with open('repos.txt', 'r') as f:
    repos = f.read().splitlines()

    # Iterate over each repository and clone it to the PWD
    for repo in repos:
        print(f'Cloning {repo}...')
        os.system(f'git clone {repo}')
        print('Done.')
