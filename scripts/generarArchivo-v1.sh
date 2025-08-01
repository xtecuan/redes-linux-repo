#!/bin/bash

rfc_http_url="https://www.rfc-editor.org/rfc/rfc2616.txt"

wget  $rfc_http_url -O /tmp/rfc2616.txt

if [ -f "/tmp/rfc2616.txt" ]
then
	cat /tmp/rfc2616.txt | grep 301 >> /tmp/301.txt
fi
