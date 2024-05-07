#!/bin/bash

# sudo apt-get install qpdf   # For Ubuntu

# qpdf --password=01101996 --decrypt ./*.pdf output.pdf
for file in *.pdf
do
	echo $file
	qpdf --password=10011996 --decrypt $file unp_$file
done
