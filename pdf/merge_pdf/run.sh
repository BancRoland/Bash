#!/bin/bash
# you need one *.pdf, and one *.pdf2 file

first_pdf=$(ls *.pdf 2>/dev/null | head -n 1)
last_pdf=$(ls *.pdf2 2>/dev/null | head -n 1)
echo $first_pdf
echo $last_pdf

qpdf --empty --pages "$first_pdf" "$last_pdf" -- "merged_$first_pdf"
