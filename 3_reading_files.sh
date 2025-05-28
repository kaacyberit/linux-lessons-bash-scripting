#!/bin/bash
# reading files
clear


## 1 - Simple read file
echo "Simple read file"
echo "============================================================================================"
echo "Enter a filename to read: "
read FILE

## if in $1 param no filename ask user to enter filename
#FILE=$1
#if [ "$FILE" == "" ] 
#  then 
#    echo "Enter a filename to read: " 
#    read FILE
#fi

## try to implement the same as above but with unary operations
#[ "$1" != "" ] && FILE=$1 || echo "Enter a filename to read:" && read FILE
#[ "$1" != "" ] || echo "Enter a filename to read:" && FILE=$1 || read FILE

echo "Filename is: $FILE"
# read file and display lines with additional info
while read -r SUPERHERO; do
echo "Superhero Name: $SUPERHERO"
done < "$FILE"
echo ""
echo ""


## 2 - Reading file using file descriptors
echo "Reading file using file descriptors"
echo "============================================================================================"
#echo "Enter a filename to read: "
#read FILE

## if in $1 param no filename ask user to enter filename
#FILE=$1
#if [ "$FILE" == "" ] 
#  then 
#    echo "Enter a filename to read: " 
#    read FILE
#fi

# open a new file descriptor
# < read
# > write
exec 5<>$FILE

# read file and display lines with additional info
while read -r SUPERHERO; do
echo "Superhero Name: $SUPERHERO"
done <&5

# write to file
echo "File was read at `date`" >&5

# close file descriptor
exec 5>&-
echo ""
echo ""


## 3 - Reading file with custom delimiter
echo "Reading file with custom delimiter"
echo "============================================================================================"
echo "Enter a filename to read: "
read DFILE
# set a new delimiter 
echo "Enter the Delimiter"
read DELIM
IFS="$DELIM"

# read file and display lines with additional info
while read -r CPU RAM HDD; do
echo "CPU: $CPU"
echo "RAM: $RAM"
echo "HDD: $HDD"
done < "$DFILE"


## make some pause before exit
echo "press ENTER to exit"
read
