#!/bin/bash
# some complex examples


## 3 Override/trap the system EXIT and execute a custom function
clear
echo "Override/trap the system EXIT and execute a custom function"
echo "============================================================================================"
# with trap we can catch system EXIT signals as well as SIGINT SIGTERM SIGTSTP, as well as commands...
# trap 'command to do when trap event happens' trap_commands trap_signals

# SIGINT - ctrl+c
# SIGTERM - kill command
# SIGTSTP - ctrl+z
# global variables
TMPFILE1="filetmp1.txt"
TMPFILE2="filetmp2.txt"
trap 'funcMyExit' EXIT
# function declarations - start
#
# run this exit instead of the default exit when called
funcMyExit () 
{
  echo "Exit Intercepted..."
  echo "Cleaning up the temp files..."
  rm -rf filetmp*.txt
  exit 255
}
# function declarations - stop
#
# script - start
echo "Write something to tmp file for later use...   " > $TMPFILE1
echo "Write something to tmp file 2 for later user..." > $TMPFILE2
echo "Trying to copy the indicated file before processing..."cp -rf $1 some_file_name.txt 2>/dev/null
if [ "$?" -eq "0" ]; then
  echo "Everything worked out ok..."
else
  echo "I guess it did not work out ok..."
  exit 1  # we will catch this exit and call custom function
fi
# script - stop
echo ""
echo ""



## 4 check the number of arguments passed to the script
## we can use special character "#" that represents the value "number of existing parameters"
echo "check the number of arguments passed to the script v2 - longer variant that gives ability to exit with custom code"
echo "v1 see in previous lessons"
echo "============================================================================================"
if [ "$#" != "3" ]; then 
  echo "USAGE: $0 [parm1] [parm2] [parm3]"
  exit 231
fi
echo "I live! I got what I needed!"


## 5 check the number of arguments passed to the script
## we can use desired number of args that represents the value "number of existing parameters"
echo "check the number of arguments passed to the script v3 - shorter variant"
echo "v2 is higher, v1 see in previous lessons"
echo "============================================================================================"
: ${3?"USAGE: $1 ARGUMENT $2 ARGUMENT $3 ARGUMENT"}
echo "I got all three!"
echo ""
echo ""


## make some pause before exit
echo "press ENTER to exit"
read
