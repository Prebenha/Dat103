#!/bin/bash
if [ -e $1 ];
then
	exist="true"
	gammal=$(stat $1  -c%Y)
else
	 exist="false"
fi
condition="hei"
	while [ true ]
	do
	sleep $2
	if [[ -e $1 && $exist == "false" ]];
	then
		condition="Opprettet"
	elif [[ ! -e $1 && $exist == "true" ]];
	then
		condition="Slettet"
	elif [[ -e $1 && $gammal != $(stat $1 -c%Y) ]];
	then
		condition="endret"
	fi
	case "$condition" in
		Opprettet)
			echo "Filen $1 ble opprettet"
			exit 0;;
		Slettet)
			echo "Filen $1 ble slettet"
			exit 0;;
		endret)
			echo "Filen $1 ble endret"
			exit 0;;
	esac
	if [ ! $condition == "hei" ]
	then
		condition="hei"
	fi
done
