#!/bin/bash

sudo mv /etc/ImageMagick-6/policy.xml /etc/ImageMagick-6/policy.xml.off

## Add border
# convert featured.png -bordercolor transparent -border 100%x0% final.png

## Resize
# convert rose:  -scale 25%  -scale 70x46\!  rose_pixelated.gif

## Bacground Color
# convert -density 300 atp-panoramic.pdf -background "#FFFFFF" -flatten  -resize 100% atp-panoramic.png

#sudo vim /etc/ImageMagick-6/policy.xml
#and replace the line
#<policy domain="coder" rights="none" pattern="PDF" />
#with
#<policy domain="coder" rights="read|write" pattern="PDF" />


## Para reducir el peso de las fotos sin bajar demasiado la calidad
# convert -strip -interlace Plane -gaussian-blur 0.05 -quality 65% 02.jpg 02b.jpg
