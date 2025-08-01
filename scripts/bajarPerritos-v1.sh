#!/bin/bash

listado_perritos='10.jpg dc7f39c5120724b079fca8159bcf2958.jpg Fotos-tiernas-de-perritos-wallpapers-2-2606567532.jpg'

url_webserver="http://localhost:9000"

for i in $listado_perritos
do

	echo "Descargando perrito $i"
        wget $url_webserver/$i -O /tmp/$i
        echo "Se descargo correctamente $i"

done
