#!/bin/bash


if [ -n "$1"  ]
then 
	echo "Creando directorio para el usuario $1"
	mkdir -p $PWD/$1
	echo "Directorio $1 creado" 
        ls -la $PWD/$1
else
	echo "Forma de uso: $0 nombre_usuario_github"
fi
