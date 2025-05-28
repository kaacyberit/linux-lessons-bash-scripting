#!/bin/bash
# demo of a simple info box with dialog and ncurses
# sudo apt-get install dialog

clear

# global variables / default values
INFOBOX=${INFOBOX=dialog}
MSGBOX=${MSGBOX=dialog}
MENUBOX=${MENUBOX=dialog}
INPUTBOX=${INPUTBOX=dialog}
TITLE="Default"
MESSAGE="Something to say"
XCOORD=10
YCOORD=20
# function declarations - start
# display the infobox and our mesage
funcDisplayInfoBox () 
{
  $INFOBOX --title "$1" --infobox "$2" "$3" "$4"
  sleep "$5"
}

funcDisplayMsgBox () 
{
  $MSGBOX --title "$1" --msgbox "$2" "$3" "$4"
}

funcDisplayMenuBox () 
{
  $MENUBOX \
  --title "[ M A I N   M E N U ]" \
  --menu "Use UP/DOWN Arrows to Move and Select or the Number of Your Choice and Enter" \
  15 45 4 \
  1 "Display Hello World" \
  2 "Display Goodbye World" \
  3 "Display Nothing" \
  X "Exit" \
  2>choice.txt
}

funcDisplayInputBox () {
  $INPUTBOX --title "$1" --inputbox "$2" "$3" "$4" 2>tmpfile.txt
}

# function declarations - stop
#
# script - start
if [ "$1" == "warning" ]; then
#  funcDisplayInfoBox "WARNING!" "We are SHUTTING DOWN the System..." "11" "21" "5"
#  echo "Shutting Down!"
#  
  funcDisplayMsgBox "WARNING!" "SCRIPT WARNING! Please press OK to close window" "10" "20"
  echo "SHUTTING DOWN NOW!!! :) :) :)"
elif [ "$1" == "menu" ]; then
  funcDisplayMenuBox
  
  case "`cat choice.txt`" in
    1) echo "Hello World";;
    2) echo "Goodbye World";;
    3) echo "Nothing";;
    X) echo "Exit";;
  esac


elif [ "$1" == "input" ]; then
  funcDisplayInputBox "Display File Name" "Which file in the current directory do you want to display?" "10" "20"
  if [ "`cat tmpfile.txt`" != "" ]; then
    cat "`cat tmpfile.txt`"
  else
    echo "Nothing to do"
  fi


else
  funcDisplayInfoBox "Information..." "You are not doing anything fun..." "11" "21" "2"
  echo "Not doing anything, back to regular scripting..."
fi
echo ""
echo ""

## make some pause before exit
sleep 2
clear


