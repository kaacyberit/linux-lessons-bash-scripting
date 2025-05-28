#!/bin/bash
# bash functions
# funtion_name, space, () brackets, {} curly brackets
# funcExample () {function code here}
# - functions CAN NOT be empty or only with comment
# - functions must be defined before you called it (it means function definition writes higher at script than function calles)
# - you can define function in single line, then you MUST use space after "{" and ";" at end of each line. Even if there is only one line
# - to call function write function name
clear

## 1 - minimal function
echo "Minimal functions"
echo "============================================================================================"
funcMinimal () {
  : # shortcut for NULL operation
}

funcMinimalOneLine () { null;}
echo ""
echo ""


## 2 - bash script structure
#
## script global variables
# here write your variables
#
## Function definitions
# here write your functions
# funcOne () {}
#
## Script itself
# script code
##########################################################
echo "bash script structure"
echo "============================================================================================"
## script global variables
VAR1=$1
#
## Function definitions

funcOne () {
  echo "Text output from function One $VAR1"
}
funcTwo () {
  echo "Text output from function Two"
}
#
## Script itself
echo "beginning of the script"
funcOne # function call
echo ""
echo ""



## 3 - variable scope (visibility)
echo "Variable scope (visibility)"
echo "============================================================================================"
## script global variables
GLOBALVAR="Globally Visible"
# function definitions - start
# sample function for function variable scope
funcVarScope () {
# local variable to the function
LOCALVAR="Locally Visible"
echo "LOCALVAR From within the function, the variable is $LOCALVAR..."
echo "GLOBALVAR From within the function, the variable is $GLOBALVAR..."
}
# functions definitions - stop
# script - start
echo "This step happens first..."
echo ""
echo "GLOBAL variable = $GLOBALVAR (before the function call)"
echo "LOCALVAR variable = $LOCALVAR (before the function call)"
echo ""
echo "Calling Function - funcExample()"
echo ""
funcVarScope
echo ""
echo "Function has been called..."
echo ""
echo "GLOBAL variable = $GLOBALVAR (after the function call)"
echo "LOCALVAR variable = $LOCALVAR (after the function call)"
echo ""
echo ""


## 4 - functions with parameters
# parameters passed to script ($1 $2 ...) is NOT visible from script
# to make them visible you need to create global variable and assign to it a value of script parameter
# PARAM1=$1 - now variable PARAM1 is visible from function, and its value its equal $1
# passing parameters to function is equal to passing parameters to script
# call function and then parameters space delimited
echo "functions with parameters"
echo "============================================================================================"
# global variable
USERNAME=$1
#
# function definitions - start
# calculate age in days
funcAgeInDays () {
# $1 - will be the 1-st parameter passed to function
echo "Hello $USERNAME, You are $1 Years Old."
echo "That makes you approximately `expr $1 \* 365` days old..."
}
# function definitions - stop
#
# scrip - start
clear
echo "Enter Your Age: "
read USERAGE
# calculate the number of days
funcAgeInDays $USERAGE  # call function with 1 parameter passed to it. from the function perspective it will be parameter $1
echo ""
echo ""


## 5 - nested functions (additional way to organize scripts)
echo "Nested functions"
echo "============================================================================================"
# global variable
GENDER=$2
# function definitions - start
# create a human being
funcHuman () {
  ARMS=2
  LEGS=2
  echo "A Human has $ARMS arms and $LEGS legs - but what gender are we?"
  echo ""
  funcHuman.Male () {
    BEARD=1
    echo "This man has $ARMS arms and $LEGS legs, with $BEARD beard(s)..."
    echo ""
  }
  funcHuman.Female () {
    BEARD=0
    echo "This woman has $ARMS arms and $LEGS legs, with $BEARD beard(s)..."
    echo ""
  }
}
# function definitions - stop
# script - start
#clear
echo "Determining the characteristics of the gender $GENDER"
echo ""
# determine the actual gender and display the characteristics
if [ "$GENDER" == "m" ]; then
funcHuman
funcHuman.Male
else
funcHuman
funcHuman.Female
fi
echo ""
echo ""


## 6 - functions returns and exit
echo "Functions returns and exit"
echo "============================================================================================"
# global variable
YES=0
NO=1
FIRST=$1
SECOND=$2
THIRD=$3
# function definitions - start
# check the command line parameters passed in
funcCheckParms () {
  # did we get three?
  # if 3-rd param is not 0 then we have at least 3 params at script
  if [ ! -z "$THIRD" ]; then
    echo "We got three parms..."
    return $YES # custom return value of the function
  else
    echo "We did not get three parms..."
    return $NO # custom return value of the function
  fi
}
# function definitions - stop# script - start
funcCheckParms
RETURN_VALS=$?
# did we get three or not?
if [ "$RETURN_VALS" -eq "$YES" ]; then
  echo "We received three parms and they are: "
  echo "Parm 1: $FIRST"
  echo "Parm 2: $SECOND"
  echo "Parm 3: $THIRD"
  echo ""
else
  echo "Usage: $0 [parm1-name] [parm2-gender] [parm3-age]"
  exit 1 # stop/brake script execution with custom exit code 
fi
echo ""
echo ""


## make some pause before exit
echo "press ENTER to exit"
read

