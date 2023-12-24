#!/bin/bash

mkdir local
cd local/
git init 
git commit -m "."
git status 
echo TEST > README.md
git status
git add .
git commit -m "[INIT]"
git push
cd ..

mkdir remote
cd remote/
git init --bare

cd ../local/
git remote add origin /home/roland/Desktop/Bash/git/local-reomote/remote
git push --set-upstream origin master