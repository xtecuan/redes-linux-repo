#!/bin/bash

# Script para buscar un patrón de texto en un archivo y contar las coincidencias.

# 1. Leer el nombre del archivo y el patrón de búsqueda del usuario.
echo "Buscador y Contador de Texto"
read -p "Ingresa el nombre del archivo de texto (ej. rfc.txt): " nombre_archivo
read -p "Ingresa el patrón de texto que deseas buscar: " patron

# 2. Verificar si el archivo existe.
if [ -f "$nombre_archivo" ]; then
  echo "---"
  echo "Buscando y contando el patrón '$patron' en el archivo '$nombre_archivo'..."
  
  # 3. Usar 'grep -c' para contar las coincidencias.
  # La opción '-c' hace que grep retorne el número de líneas coincidentes.
  coincidencias=$(grep -c "$patron" "$nombre_archivo")
  
  echo "---"

  # 4. Mostrar el resultado.
  if [ "$coincidencias" -gt 0 ]; then
    echo "✅ Se encontraron $coincidencias coincidencias para el patrón '$patron'."
  else
    echo "❌ No se encontraron coincidencias para el patrón '$patron'."
  fi

else
  # Si el archivo no existe, mostramos un mensaje de error.
  echo "---"
  echo "❌ Error: El archivo '$nombre_archivo' no se encontró. Por favor, verifica el nombre."
fi

echo "---"

