#!/bin/bash

#files to compare
F1=path/to/original
F2=path/to/new

#website for wget
site="example.com"

#email information
notify1="receivers@email.address"
from="From:senders@email.address"

#comparing the files
compare=(`diff "$F1" "$F2"`)

#grabbing the site
(`wget -O "$F2" "$site"`)

if [ "$compare" != "" ]; then
	(`echo 'A change has been made to '$site'' | mail -s "SITE CHANGE DETECTED" "$notify1" -a "$from"`)
	echo "change made"
else
	echo "no changes made"
fi
