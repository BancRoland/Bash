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
git remote add origin ../remote
git push --set-upstream origin master
git log --oneline

cd ..
mkdir other
cd other
git clone ../remote
cd remote
echo test2 >> README.md 
git add .
git commit -m "[FIX] mod"
git push