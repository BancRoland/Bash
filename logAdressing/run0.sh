DATE=$(date +%y%m%d)

rm *.log

#echo "kr${DATE}"

for i in {0..5}
do
	#echo $(printf '%.4d\n' $i)
	touch kr${DATE}$(printf '%.4d\n' $i).log
done

touch out.dat

#VAR="ls kr${DATE}*.log"
VAR2="ls kr${DATE}*.log"

VAR3=$(eval $VAR2 | tail -n 1)



echo $VAR3
A=${VAR3:8:4}
echo $((A))
NUM=$((A+1))

ls
touch kr${DATE}$(printf '%.4d\n' $NUM).log
ls
