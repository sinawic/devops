#!/bin/bash
#title           :git-add-repo.sh
#description     :This script will add existing directory to a git repo on main branch
#author          :sinawic
#date            :20230116

git init
git remote add origin <remote url>
git add .
git commit -m "Initial commit"
git switch -c main
git push -u origin main