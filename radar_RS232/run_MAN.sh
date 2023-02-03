#!/bin/bash
HMAX=3072
HMIN=1024

VMIN=-114
#VMAX=342; echo DEFAULT MOTOR SETUP	#alap motor
VMAX=1000; echo ROCKET MOTOR SETUP	#ROCKET motor


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
	
	case $val in
	
	#KALIBRÁCIÓK
		'hCAL')
			printf ":2C\n\r" >&99
			read -t 1
			HVAL=2048
			;;
			
		'vCAL')
			printf ":4C\n\r" >&99
			read -t 1
			VVAL=0
			;;
	
	#HORIZONTÁLIS ÉRTÉKEK
		'-' | 'h-')
			HVAL=$((HVAL-14));;
		'--' | 'h--')
			HVAL=$((HVAL-70));;
		'---' | 'h---')
			HVAL=$((HVAL-140));;
		'+' | 'h+')
			HVAL=$((HVAL+14));;
		'++' | 'h++')
			HVAL=$((HVAL+70));;
		'+++' | 'h+++')
			HVAL=$((HVAL+140));;
		'0' | 'h0')
			HVAL=2048;;
		'hMAX')
			HVAL=$HMAX;;
		'hMIN')
			HVAL=$HMIN;;
	#VERTIKÁLIS ÉRTÉKEK
		'v-')
			VVAL=$((VVAL-30));;
		'v--')
			VVAL=$((VVAL-60));;
		'v---')
			VVAL=$((VVAL-120));;
		'v+')
			VVAL=$((VVAL+30));;
		'v++')
			VVAL=$((VVAL+60));;
		'v+++')
			VVAL=$((VVAL+120));;
		'v0')
			VVAL=0;;
		'vMAX')
			VVAL=$VMAX;;
		'vMIN')
			VVAL=$VMIN;;
	#PARKOLÓ POZÍCIÓ
		'00')
			VVAL=0
			HVAL=2048;;
			
	#POCO
		'R+')
			printf ":3P0\n\r" >& 99
			read -t 1
			printf ":3P3\n\r" >& 99
			echo "RADIATION ON"
			;;
			
		'R-')
			printf ":3P0\n\r" >& 99
			echo "RADIATON OFF"
			;;		
	
	#kivételkezelés
		*)
			echo -n 'INVALID COMMAND';;
			
	esac
	
	
			
	#HORIZONTÁLIS szélsőértékkorrekció		
	if (( HVAL < $HMIN )); then
		HVAL=$HMIN; fi
		
	if (( HVAL > $HMAX )); then
		HVAL=$HMAX; fi
			
	#VERTIKÁLIS szélsőértékkorrekció		
	if (( VVAL < $VMIN )); then
		VVAL=$VMIN; fi
		
	if (( VVAL > $VMAX )); then
		VVAL=$VMAX; fi
	
	
	HVAL_HEX0=$(printf '%.4X\n' $HVAL)
	HVAL_HEX=${HVAL_HEX0:(-4)}
	
	VVAL_HEX0=$(printf '%.4X\n' $VVAL)
	VVAL_HEX=${VVAL_HEX0:(-4)}
	
	printf ":2H$HVAL_HEX\n\r" >&99
	read -t 1
	printf ":4V$VVAL_HEX\n\r" >&99
	
	echo "HOR:	HEX: 0x$HVAL_HEX	DEC: ${HVAL-2048}"
	echo "VER:	HEX: 0x$VVAL_HEX	DEC: $VVAL"
	
	
done
