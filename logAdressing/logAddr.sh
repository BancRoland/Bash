DATE=$(date +%y%m%d)


#rm *.log

#echo "kr${DATE}"

#for i in {0..5}
#do
	#echo $(printf '%.4d\n' $i)
#	touch kr${DATE}$(printf '%.4d\n' $i).log
#done

touch out.log

#VAR="ls kr${DATE}*.log"

if [[ -f "./out.log" ]]; then

mkdir ${DATE}

if [[ -f "./${DATE}/kr${DATE}0000.log" ]]; then


#echo THERE IS SUCH FILE
VAR2="ls ./${DATE}/kr${DATE}*.log"
VAR3=$(eval $VAR2 | tail -n 1)
#echo $VAR3
A=${VAR3:17:4}
#echo A = $A
#echo $((10#$A))
NUM=$((10#$A+1))

else

#echo NO SUCH FILE
NUM=0

fi


#echo NUM = $NUM
FILENAME="kr${DATE}$(printf '%.4d\n' $NUM).log"


#ls ${DATE}
#echo ""

mv out.log ${DATE}/kr${DATE}$(printf '%.4d\n' $NUM).log
#ls ${DATE}

echo WRITE DESCRIPTION:
read DES
echo "$FILENAME	$DES" >> ${DATE}/README_${DATE}.txt

else

echo out.log NOT FOUND

fi
