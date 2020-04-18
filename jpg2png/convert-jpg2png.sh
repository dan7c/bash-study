#!/bin/bash

convertImage(){
cd ../
if [ ! -d converted-png ] 
then
	mkdir converted-png
fi

for image in *.jpg
do
	local img_name=$(ls $image | awk -F. '{ print $1 }')
	convert $img_name.jpg converted-png/$img_name.png
done
}

convertImage 2>../log.txt
if [ $? -eq 0 ] 
then
	echo "Conversion success"
	rm log.txt
else	
	mkdir error
	mv log.txt error
	echo "Conversion error. Created log file in /error"
fi
