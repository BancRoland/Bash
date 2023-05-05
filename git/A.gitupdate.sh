#!/bin/bash

echo "

██████  ██    ██ ████████ ██   ██  ██████  ███    ██ 
██   ██  ██  ██     ██    ██   ██ ██    ██ ████   ██ 
██████    ████      ██    ███████ ██    ██ ██ ██  ██ 
██         ██       ██    ██   ██ ██    ██ ██  ██ ██ 
██         ██       ██    ██   ██  ██████  ██   ████ 
                                                     
                                                     
"

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


echo "

 ██████          ██████  ██████  ██████  ███████ 
██              ██      ██    ██ ██   ██ ██      
██              ██      ██    ██ ██   ██ █████   
██              ██      ██    ██ ██   ██ ██      
 ██████ ███████  ██████  ██████  ██████  ███████ 
                                                 
                                                                    
"

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
    git add .
    git commit -m "."
    git push
fi

echo "

██████   █████  ███████ ██   ██ 
██   ██ ██   ██ ██      ██   ██ 
██████  ███████ ███████ ███████ 
██   ██ ██   ██      ██ ██   ██ 
██████  ██   ██ ███████ ██   ██ 
                                
                                
"
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


echo "

██   ██ ██    ██ ██    ██ ██ ██   ██ 
██  ██  ██    ██ ██    ██ ██ ██  ██  
█████   ██    ██ ██    ██ ██ █████   
██  ██  ██    ██  ██  ██  ██ ██  ██  
██   ██  ██████    ████   ██ ██   ██ 
                                     
                                     
"
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