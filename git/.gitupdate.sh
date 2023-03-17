#!/bin/bash

cd Python
sleep 1
git pull
sleep 1
git status
read -p "do you want to add? (y/n) " yn
if [[ $yn == "y" ]]
then
    git add .
    git commit -m "."
    git push
fi

cd ..
cd c_code
sleep 1
git pull
sleep 1
git status
read -p "do you want to add? (y/n)" yn
if [[ $yn == "y" ]]
then
    echo you choose yes
fi

cd ..
cd Bash
sleep 1
git pull
sleep 1
git status
read -p "do you want to add? (y/n) " yn
if [[ $yn == "y" ]]
then
    git add .
    git commit -m "."
    git push
fi


cd ..
cd kuvik
sleep 1
git pull
sleep 1
git status
read -p "do you want to add? (y/n) " yn
if [[ $yn == "y" ]]
then
    git add .
    git commit -m "."
    git push
fi