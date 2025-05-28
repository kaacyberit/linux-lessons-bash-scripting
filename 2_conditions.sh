#!/bin/bash
# condition statements, cases, loops
clear


## 1 - statement simple if/then
echo "Statement simple if/then"
echo "============================================================================================"
echo ""
echo "Enter a number between 1 and 10 and try to guess the secret number"
read GUESSNUM
if [ $GUESSNUM -eq 7 ]
  then
    echo "You have WEEN !!!"
fi
echo ""
echo ""


## 2 - statement if/then/else
# you can use it without else block. in such case if conditions in if brackets is true it will execute everything tat inside "then".
# if not - script will go forward
echo "Statement if/then/else"
echo "============================================================================================"
echo ""
echo "Enter a number between 1 and 10 and try to guess the secret number"
read GUESSNUM
if [ $GUESSNUM -eq 7 ]
  then
    echo "You have WEEN !!!"
  else
    echo "FALSE! you have loose :("
fi
echo ""
echo "Statement if/then/else to test files (in this example \"file.txt\")"
FILENAME="file.txt"
#FILENAME=$1
#if [ -e $FILENAME ] # to test file existance use -e -a -f
#if [ ! -e $FILENAME ] # to test file NOT existance use -e -a -f
if [ -e $FILENAME ] && [ -w $FILENAME ]  # to test file existance use -e -a -f and  writeable
  then	# if stetament is TRUE
    echo "File $FILENAME does exists and writeable!"
  else	# if stetament is FALSE
    echo "File $FILENAME does NOT exist"
fi
echo ""
echo ""


## 3 - Statement if/then/elif/else
echo "Statement if/then/elif/else"
echo "============================================================================================"
echo ""
echo "Enter a number between 1 and 3:"
read VALUE
if [ "$VALUE" -eq "1" ] 2>/dev/null; then
echo "You entered #1"
elif [ "$VALUE" -eq "2" ] 2>/dev/null; then
echo "You successfully entered #2"
elif [ "$VALUE" -eq "3" ] 2>/dev/null; then
echo "You entered the 3rd number"
else
echo "You didn't follow the directions!"
fi
echo ""
echo ""



## 4 - Statement FOR loop
echo "Statement FOR loop"
echo "============================================================================================"
echo ""
echo "List all the shell scripts contents of the directory"
SHELLSCRIPTS=`ls *.sh`
for SCRIPT in "$SHELLSCRIPTS"; do
  DISPLAY="`cat $SCRIPT`"
  echo "File: $SCRIPT - Contents $DISPLAY"
done
echo ""
echo ""


## 5 - Statement CASE"
echo "Statement CASE"
echo "============================================================================================"
echo ""
echo "MAIN MENU"
echo "=================="
echo "1) Choise One"
echo "2) Choise Two"
echo "3) Choise Three"
echo ""
echo "Enter your choise:"

read MENUCHOISE

case $MENUCHOISE in
  1)
    echo "Option ONE" 
    ;;
  2)
    echo "Option TWO"
    ;;
  3)
    echo "Option THREE"
    ;;
  *) # default option if nothing choose 
    echo "You've chosen unwisely"
    ;;
esac
echo ""
echo ""


## 6 - Statement WHILE loop
echo "Statement WHILE loop"
echo "============================================================================================"
echo ""
echo "How many times do you want to display \"Hello world\"?" 
read DISPLAYCOUNT
COUNT=1

while [ $COUNT -le $DISPLAYCOUNT ] # le less then on equal
do
  echo "Hello world - $COUNT"
  COUNT="`expr $COUNT + 1`"
done
echo ""
echo ""


## 7 - Unary operations
echo "Unary operations"
echo "============================================================================================"
echo "Enter a number between 1 and 5: "
read VALUE
if [ "$VALUE" -eq "1" ] || [ "$VALUE" -eq "3" ] || [ "$VALUE" -eq "5" ];
then
echo "You entered the ODD value of $VALUE"
else
echo "You entered a value of $VALUE"
fi


## 8 - Unary operations 2
echo "Unary operations 2"
echo "============================================================================================"
rm superpuper 2> /dev/null && echo "File exists and was removed" || echo "File does not exist and cannot be deleted"
echo ""
echo ""


## make some pause before exit
echo "press ENTER to exit"
read
