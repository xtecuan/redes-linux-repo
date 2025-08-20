#!/bin/bash

# Solicitar información de Usuarios
echo "Ingrese sus nombres:"
read nombres
echo "Ingrese sus apellidos:"
read apellidos
echo "Ingrese su correo electrónico:"
read correo

# Crear archivo con formato DÍA/MES/AÑO (ddmmyyyy)
echo "nombres: $nombres" > user_data.txt
echo "apellidos: $apellidos" >> user_data.txt
echo "e-mail: $correo" >> user_data.txt
echo "reporte del $(date +'%d%m%Y')" >> user_data.txt  # ¡AGREGADO DÍA!

echo "Archivo user_data.txt creado con éxito!"


