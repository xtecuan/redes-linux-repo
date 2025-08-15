#!/bin/bash
echo "Script que lee información del Usuario desde BASH"

read -ep "Ingrese sus Nombres: " nombres
read -ep "Ingrese sus Apellidos: " apellidos
read -ep "Ingrese su correo electrónico: " email

nombre_reporte="reporte_$(date +%d_%m_%Y).txt"

echo "Generando el reporte $nombre_reporte"

echo "Nombres: $nombres" >> $nombre_reporte
echo "Apellidos: $apellidos" >> $nombre_reporte
echo "E-mail: $email" >> $nombre_reporte

echo "Se genero el reporte con éxito!"
