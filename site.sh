#!/bin/bash

#verifies correct number of arguments
if [ $# == 0 ]; then
	printf 'No arguments given, 2 expected.\n' >&2;
	printf 'Usage: arg1 = site URL, arg2 = receiver email address, arg3 = sender email address\n' >&2;
	exit 1;
elif [ $# -lt 3 ]; then
	printf 'Not enough arguments given, 3 expected.\n' >&2;
	exit 1;
elif [ $# -gt 3 ]; then
	printf 'Too many arguments given, 3 expected.\n' >&2;
	exit 1;
fi

#files to compare
F1=original
F2=new

#website
site=$1

#email info
notify1=$2
from="From:$3"

if [ -f "$F1" ]; then
	#grabbing the site
	(`wget -O "$F2" "$site"`)
	
	#compare the files
	compare=(`diff "$F1" "$F2"`)
	
	if [ "$compare" != "" ]; then
       		(`echo 'A change has been made to '$site'' | mail -s "SITE CHANGE DETECTED" "$notify1" -a "$from"`) 
		echo "change made" 
	else
       		echo "no changes made" 
	fi
else
	(`wget -O "$F1" "$site"`)
fi
