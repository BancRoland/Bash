#!/bin/bash

for file in *.pdf
do
	echo $file
    qpdf --show-npages "$file"
	qpdf "$file" --pages . 1-16 -- "trunc_$file"
     
done
