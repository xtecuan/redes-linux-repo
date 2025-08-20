#!/usr/bin/env bash

# Script para buscar patrones en un archivo de texto
# Hecho por: Navas1689

echo "Archivo a analizar [cuento_piel_de_asno.txt]: "
read ruta_ingresada

# Si no se escribe nada, usa "cuento_piel_de_asno.txt"
if [ -z "$ruta_ingresada" ]; then
    FUENTE="cuento_piel_de_Asno.txt"
else
    FUENTE="$ruta_ingresada"
fi

# Si el archivo no existe, pregunta si descargar desde GitHub
if [ ! -f "$FUENTE" ]; then
    echo "No encontré el archivo '$FUENTE'."
    echo "¿Quieres descargar 'cuento_piel_de_Asno.txt' desde GitHub? (s/N)"
    read respuesta
    if [ "$respuesta" = "s" ] || [ "$respuesta" = "S" ]; then
        FUENTE="cuento_piel_de_Asno.txt"
        echo "Descargando cuento_piel_de_Asno.txt desde GitHub..."
        # URL RAW de tu archivo en GitHub
        URL="https://raw.githubusercontent.com/Navas1689/redes-linux-repo/main/cuento_piel_de_Asno.txt"
        
        # Intenta con curl, si no con wget
        if command -v curl &> /dev/null; then
            curl -s -o "$FUENTE" "$URL"
        elif command -v wget &> /dev/null; then
            wget -q -O "$FUENTE" "$URL"
        else
            echo "Error: No tienes curl ni wget instalados."
            exit 1
        fi
        
        # Verifica que la descarga fue exitosa
        if [ $? -eq 0 ]; then
            echo "¡Descarga completada!"
        else
            echo "Error: No se pudo descargar el archivo."
            exit 1
        fi
    else
        echo "Saliendo del programa."
        exit 1
    fi
fi

# Pide el patrón a buscar (no puede estar vacío)
while true; do
    echo "Patrón (texto o regex) a buscar: "
    read CONSULTA
    if [ -n "$CONSULTA" ]; then
        break
    else
        echo "El patrón no puede estar vacío."
    fi
done

# Pregunta si ignorar mayúsculas/minúsculas
echo "¿Ignorar mayúsculas/minúsculas? (s/N): "
read ignorar
if [ "$ignorar" = "s" ] || [ "$ignorar" = "S" ]; then
    OPCIONES="-i"
else
    OPCIONES=""
fi

# Genera un nombre de archivo de salida con fecha y hora
FECHA=$(date +"%Y%m%d_%H%M%S")
SALIDA="resultado_$FECHA.txt"

echo "=== Buscando en: $FUENTE ==="

# Busca el patrón y guarda los resultados
grep $OPCIONES -n "$CONSULTA" "$FUENTE" | tee "$SALIDA"

# Cuenta las coincidencias
if [ "$OPCIONES" = "-i" ]; then
    TOTAL=$(grep $OPCIONES -c "$CONSULTA" "$FUENTE")
else
    TOTAL=$(grep -c "$CONSULTA" "$FUENTE")
fi

echo "--------------------------------"
echo "Coincidencias encontradas: $TOTAL"
echo "Resultados guardados en: $SALIDA"
