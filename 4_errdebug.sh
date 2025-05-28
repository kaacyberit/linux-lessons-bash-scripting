#!/bin/bash
# Debugging and Error Handling:

clear

## 1 - Debugging scripts
# there is two options:
# run bash with debugging option on: bash -x scriptname.sh
# or enable/disable debugging for part of script inside script itself. 
## "set -x" enables debugging. at the top of script for debugging all script. or for part of the code.
## "set +x" DISables debugging

echo "Statement simple if/then"
echo "============================================================================================"
echo ""
echo "Enter a number between 1 and 10 and try to guess the secret number"
set -x  # enable debugging
read GUESSNUM
if [ $GUESSNUM -eq 7 ]
  then
    echo "You have WEEN !!!"
fi
set +x  # DISables debugging
echo ""
echo ""


## 2 - Exit status
# each command leaves a trace in the system whether the command was successful or not - this called exit status.
# we can use those exit statuses to change behavior our script
# we can get it thru special variable - $?
# if it returns 0 - command ended successfully 
# if it returns NOT 0 - some error was occurred
#
# by default scripts executes line by line just skipping errors
# but if your script values or script behavior depend from other values
# and this "other values" can be without correct value due to an error
# this can cause serious problems
# one way you can check exit statuses for each command (or only for important/dangerous commands) and decide whether or not to continue script execution
# or you can set option to abort script as soon as error occurred. it makes with "set -e" command
#
#set -e   # enables an option to abort script as soon as error occurred
echo "Exit status \(set -e\)"
echo "============================================================================================"
echo "Today is:"
date
echo "Exit status of last date command is: $?"
echo "remove nonexisting file"
rm sdfsdgasfgafgasfgasfg
echo "Exit status of last rm command is: $?"
echo "1 + 1 = `expr 1 + 1`"
echo "Exit status of last expr command is: $?"
echo ""
echo ""


echo "Exit status - manual error handling"
echo "============================================================================================"
echo "change to a directory and list the contents"
DIR=$1
cd $DIR
if [ "$?" = "0" ]
then
  echo "Directory exists. Its content below:"
  echo "`ls -al`"
else
  echo "There is no such directory. exiting with error"
  exit 1 # !!!!! aborting script and set non zero exit status
fi
echo ""
echo ""


## 3 TRAP an events
echo "TRAP an events"
echo "============================================================================================"
# with trap we can catch system signals (SIGINT SIGTERM SIGTSTP), commands...
# trap 'command to do when trap event happens' trap_commands trap_signals
# SIGINT - ctrl+c
# SIGTERM - kill command
# SIGTSTP - ctrl+z
trap 'echo " - Press q/Q to Exit!"' SIGINT SIGTERM SIGTSTP

# display simple menu
while [ "$CHOISE" != "q" ] && [ "$CHOISE" != "Q" ];
do
echo "MAIN MENU"
echo "=================="
echo "1) Choise One"
echo "2) chiose TWO"
echo "3) Choise Three"
echo "Q) Quit/Exit"
echo ""
echo "enter your choise:" 
read CHOISE
clear
done
echo ""
echo ""


## make some pause before exit
echo "press ENTER to exit"
read

