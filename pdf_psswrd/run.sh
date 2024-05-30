#!/bin/bash

# sudo apt-get install qpdf   # For Ubuntu

# qpdf --password=01101996 --decrypt ./*.pdf output.pdf

echo "Please enter a password:"
read password

for file in *.pdf
do
	echo $file
	qpdf --password=$password --decrypt "$file" "unp_$file"
done
