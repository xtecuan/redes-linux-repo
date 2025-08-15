
#!/bin/bash

# Este script solicita al usuario su nombre, apellido y correo electrónico,
# y luego guarda esta información en un archivo de texto.

# 1. Solicitar la información al usuario
echo "Por favor, ingresa tu información."
read -p "Nombres: " nombres
read -p "Apellidos: " apellidos
read -p "Correo electrónico: " correo

# 2. Obtener la fecha actual en el formato dd_mm_yyyy
fecha=$(date +%d_%m_%Y)

# 3. Crear el nombre del archivo de salida
nombre_archivo="reporte_$fecha.txt"

# 4. Guardar la información en el archivo
echo "Nombres: $nombres" > "$nombre_archivo"
echo "Apellidos: $apellidos" >> "$nombre_archivo"
echo "Correo electrónico: $correo" >> "$nombre_archivo"

# 5. Informar al usuario que la operación ha sido completada
echo "---"
echo "¡Hecho! La información ha sido guardada en el archivo: $nombre_archivo"

