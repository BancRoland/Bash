#!bin/bash

LIM=1M
echo files larger than $LIM:
find . -size +$LIM

#find . -size +$LIM > .gitignore


echo
echo *.png > .gitignore
echo *.PNG >> .gitignore
echo *.log >> .gitignore
echo *.LOG >> .gitignore
echo *.bin >> .gitignore
echo *.BIN >> .gitignore
echo *.dat >> .gitignore
echo *.DAT >> .gitignore
echo *.deb >> .gitignore
echo *.cf32 >> .gitignore
echo *.i16 >> .gitignore
echo *.out >> .gitignore
echo *.ci16 >> .gitignore
echo *.taps >> .gitignore
echo *.c >> .gitignore
echo *.out >> .gitignore

echo .gitignore file:
echo
cat .gitignore
