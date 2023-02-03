#!/bin/bash
HMAX=3072
HMIN=1024

VMIN=-114
#VMAX=342; echo DEFAULT MOTOR SETUP	#alap motor
VMAX=1010; echo ROCKET MOTOR SETUP	#ROCKET motor


DEVICE=$(ls /dev/ttyUSB*)
HVAL=2048
VVAL=0



echo $DEVICE

sudo chmod o+rw $DEVICE
stty ispeed 9600 < $DEVICE
stty speed < /dev/ttyUSB*
exec 99<>$DEVICE
exec 99<>/dev/ttyUSB*
read -t 0.5
echo serial init
printf ":2I\n\r" >& 99
read -t 0.5
echo ":2I\n\r"
printf ":2A\n\r" >& 99
read -t 0.5
echo ":2A\n\r"
printf ":2H0800\n\r" >&99
read -t 0.5
printf ":4V0000\n\r" >&99

echo " "
echo " "
echo " "
echo "AZIMUT CAL!:		hCAL"
echo " "
echo "AZIMUT MAX:		hMAX"
echo "AZIMUT BIG INC:		+++"
echo "AZIMUT MED INC:		++"
echo "AZIMUT SMALL INC:	+"
echo "AZIMUT ZERO:	0"
echo "AZIMUT SMALL DEC:	-"
echo "AZIMUT MED DEC:		--"
echo "AZIMUT BIG DEC:		---"
echo "AZIMUT MIN:		hMIN"
echo " "
echo " "
echo "ELEVATION CAL:		vCAL"
echo " "
echo "ELEVATION MAX:		vMAX"
echo "ELEVATION BIG INC:	v+++"
echo "ELEVATION MED INC:	v++"
echo "ELEVATION SMALL INC:	v+"
echo "ELEVATION ZERO:	v0"
echo "ELEVATION SMALL DEC:	v-"
echo "ELEVATION MED DEC:	v--"
echo "ELEVATION BIG DEC:	v---"
echo "ELEVATION MIN:		vMIN"
echo " "
echo "TOTAL RESET:		00"
echo " "

echo "RADIATION ON		R+"
echo "RADIATION OFF		R-"
echo "WAITING FOR ORDER..."

while :
do

	read val
	
	#KALIBRÁCIÓK
	if [ $val == 'hCAL' ]; then
		printf ":2C\n\r" >&99
		read -t 1
		HVAL=2048
		fi

	if [ $val == 'vCAL' ]; then
		printf ":4C\n\r" >&99
		read -t 1
		VVAL=0
		fi
	
	
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
	
	if [ $val == 'hMAX' ]; then
		HVAL=$HMAX; fi
		
	if [ $val == 'hMIN' ]; then
		HVAL=$HMIN; fi
			
	#HORIZONTÁLIS szélsőértékkorrekció		
	if (( HVAL < $HMIN )); then
		HVAL=$HMIN; fi
		
	if (( HVAL > $HMAX )); then
		HVAL=$HMAX; fi
	
	
	
	#VERTIKÁLIS ÉRTÉKEK
	if [ $val == 'v-' ]; then
		VVAL=$((VVAL-30)); fi
			
	if [ $val == 'v--' ]; then
		VVAL=$((VVAL-60)); fi		

	if [ $val == 'v---' ]; then
		VVAL=$((VVAL-120)); fi	

	if [ $val == 'v+' ]; then
		VVAL=$((VVAL+30)); fi
			
	if [ $val == 'v++' ]; then
		VVAL=$((VVAL+60)); fi
		
	if [ $val == 'v+++' ]; then
		VVAL=$((VVAL+120)); fi
		
	if [ $val == 'v0' ]; then
		VVAL=0; fi
		
	if [ $val == 'vMAX' ]; then
		VVAL=$VMAX; fi
		
	if [ $val == 'vMIN' ]; then
		VVAL=$VMIN; fi
			
	#VERTIKÁLIS szélsőértékkorrekció		
	if (( VVAL < $VMIN )); then
		VVAL=$VMIN; fi
		
	if (( VVAL > $VMAX )); then
		VVAL=$VMAX; fi
	
	
	
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
	
	echo "HOR:	HEX: 0x$HVAL_HEX	DEC: ${HVAL-2048}"
	echo "VER:	HEX: 0x$VVAL_HEX	DEC: $VVAL"
	
	
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
