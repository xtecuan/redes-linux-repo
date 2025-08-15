#!/bin/bash

rfc_http_url="https://www.rfc-editor.org/rfc/rfc2616.txt"

wget  $rfc_http_url -O /tmp/rfc2616.txt

###El primer parametro sera el codigo http a buscar

if [ -n "$1"  ]
then

	if [ -f "/tmp/rfc2616.txt" ]
	then
		cat /tmp/rfc2616.txt | grep "$1" >> /tmp/$1.txt
                cat /tmp/$1.txt
	fi
else
	echo "Forma de uso $0 codigo_http_a_buscar"

fi
