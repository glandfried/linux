#!/bin/bash

sudo mv /etc/ImageMagick-6/policy.xml /etc/ImageMagick-6/policy.xml.off

## Add border
# convert featured.png -bordercolor transparent -border 100%x0% final.png

## Resize
# convert rose:  -scale 25%  -scale 70x46\!  rose_pixelated.gif

#sudo vim /etc/ImageMagick-6/policy.xml
#and replace the line
#<policy domain="coder" rights="none" pattern="PDF" />
#with
#<policy domain="coder" rights="read|write" pattern="PDF" />

