#!/bin/bash
echo "Script que lee un patrón de texto con GREP"

read -ep "Ingrese el patrón de busqueda en el archivo: " patron

nombre_archivo="$PWD/Las_tres_lenguas.txt"


cat $nombre_archivo | grep "$patron"

