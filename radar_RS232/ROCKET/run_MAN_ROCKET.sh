#!/bin/bash
DEVICE=$(ls /dev/ttyUSB*)
HVAL=2048
VVAL=0

echo $DEVICE

sudo chmod o+rw $DEVICE
stty ispeed 9600 < $DEVICE
stty speed < /dev/ttyUSB*
exec 99<>$DEVICE
exec 99<>/dev/ttyUSB*
read -t 1
printf ":2I\n\r" >& 99
read -t 1
printf ":2A\n\r" >& 99
read -t 1
printf ":2H0800\n\r" >&99
read -t 1
printf ":4V0000\n\r" >&99
read -t 1
printf ":4C\n\r" >&99
read -t 1


echo "AZIMUT SMALL INC:	+"
echo "AZIMUT BIG INC:		++"
echo "AZIMUT SMALL DEC:	-"
echo "AZIMUT BIG DEC:		--"
echo "ELEVATION SMALL INC:	v+"
echo "ELEVATION BIG INC:	v++"
echo "ELEVATION SMALL DEC:	v-"
echo "ELEVATION BIG DEC:	v--"
echo "RADIATION ON		R+"
echo "RADIATION OFF		R-"
echo "90 DEG ELEVATION		VVV"
echo "WAITING FOR ORDER"

while :
do

	read val
	
	
	#HORIZONTÁLIS ÉRTÉKEK
	if [ $val == '-' ]; then
		HVAL=$((HVAL-14)); fi
			
	if [ $val == '--' ]; then
		HVAL=$((HVAL-70)); fi		
		
	if [ $val == '---' ]; then
		HVAL=$((HVAL-140)); fi		

	if [ $val == '+' ]; then
		HVAL=$((HVAL+14)); fi
			
	if [ $val == '++' ]; then
		HVAL=$((HVAL+70)); fi
		
	if [ $val == '+++' ]; then
		HVAL=$((HVAL+140)); fi
		
	if [ $val == '0' ]; then
		HVAL=2048; fi
			
	#HORIZONTÁLIS szélsőértékkorrekció		
	if (( HVAL < 1024 )); then
		HVAL=1024; fi
		
	if (( HVAL > 3072 )); then
		HVAL=3072; fi
	
	
	
	#VERTIKÁLIS ÉRTÉKEK
	if [ $val == 'v-' ]; then
		VVAL=$((VVAL-10)); fi
			
	if [ $val == 'v--' ]; then
		VVAL=$((VVAL-20)); fi			

	if [ $val == 'v+' ]; then
		VVAL=$((VVAL+10)); fi
			
	if [ $val == 'v++' ]; then
		VVAL=$((VVAL+20)); fi
		
	if [ $val == 'v0' ]; then
		VVAL=0; fi
		
	if [ $val == 'VVV' ]; then
		VVAL=1000; fi
	
			
	#VERTIKÁLIS szélsőértékkorrekció		
	if (( VVAL < -114 )); then
		VVAL=-114; fi
		
	if (( VVAL > 1010 )); then
		VVAL=1010; fi
	
	
	
	if [ $val == '00' ]; then
		VVAL=0
		HVAL=2048
	fi
	
	

	
	
	HVAL_HEX0=$(printf '%.4X\n' $HVAL)
	HVAL_HEX=${HVAL_HEX0:(-4)}
	
	VVAL_HEX0=$(printf '%.4X\n' $VVAL)
	VVAL_HEX=${VVAL_HEX0:(-4)}
	
	printf ":2H$HVAL_HEX\n\r" >&99
	read -t 1
	printf ":4V$VVAL_HEX\n\r" >&99
	
	echo "HOR=${HVAL-2048}	$HVAL_HEX"
	echo "VER=$VVAL	$VVAL_HEX"
	
	
	#POCO
	if [ $val == 'R+' ]; then
		printf ":3P0\n\r" >& 99
		read -t 1
		printf ":3P3\n\r" >& 99
		echo "RAD ON"
	fi
	
	if [ $val == 'R-' ]; then
		printf ":3P0\n\r" >& 99
		echo "RAD OFF"
	fi
	
	
done

#printf ":4V0100\n\r" >&99
#read -t 3
#printf ":4V0000\n\r" >&99

#read "Press ENTER for radiation!"
#printf ":2" >& 99
