#!/bin/bash
# bash script - set of bash commands composed in one file. Script file must have an execution bit set! "chmod u+x [filename]"
# fist line of script file called SHEBANG - represent shell that will process this script file
# Text starts with # sign up to the end of line - is COMMENT

# 0 - comments
# this is a comment. it begins from sign # till to the end of the line


# 1 - lets clear the screen for better view and print info about system. for this use regular command "clear"
# and lets print some message/text using echo command
clear # this is also a comment
echo "Hello script world!"
echo "======================================="
echo "Info about system:"
uname -a # print info about system that you work on
echo String without quotes # in most cases it works fine. But more correct way its to use quotes
echo "String with quotes"
echo ""
echo ""


# 2 - to interpret text as command/sub-command and not as text, and to get command execution results you must write command in back-ticks (at the tilda button)
# results you can use as text for output inside echo statements or as variable value.
# without back-ticks shell interpret text as direct text to display or direct value to store in variable.
# with back-ticks shell interpret text as command to execute
echo "Sub commands results"
echo "======================================="
echo "Today is: date"   # display date as text
echo "Today is: "date   # display date as text
echo "Today is: `date`" # interprets date as command to execute an display command results
echo "Today is: "`date` # interprets date as command to execute an display command results
echo ""
echo ""


# 3 - special characters and two types of quotes
# some of the characters bash interprets as those that has special meaning.
# for example quotes. echo command print all that INSIDE the quotes, but not the quotes themselves.
# if you want to print quotes inside the message you have to "escape" it with "\" sign. 
# escape symbol act only for one symbol after. If you want to print more then one special symbol you need to escape each one.
# escape symbol can be escaped to.
# there is two types of quotes: 
# - double quotes (") - week quotes. shell will parse text in this quotes and replace variable with its values, run expressions and so on.
# because of that behavior, if you'd like to use special characters in text, those characters need to be ESCAPED with "\" symbol. 
# - single quotes (') - strong quotes. shell will NOT parse/interpret text in this quotes and will print it as is.
echo "Special characters and quotes in scripts"
echo "======================================="
echo "Print one quote - \", 5 quotes - \"\"\"\"\""
echo "Print one escape symbol - \\"
echo "To print 5 escape symbols at console we need to write 10 those symbols at script - \\\\\\\\\\"
echo ""
echo "same text inside soft and hard quotes"
echo "Hello (\`date\`) `date`" # character ' escaped with \ to print correctly
echo 'Hello (\`date\`) `date`' # text prints as is with all special characters
echo ""
echo "Combinations of quotes"
echo "Hello ('\`date\`') `date`"
echo 'Hello ("\`date\`") `date`'
echo ""
echo ""


# 4 - lets print some message/text with variables using echo command
# in linux system we have predefined variables. Some of them we can see with "env", "printenv", "set" or "export" command.
# but it is possible to get only one (that you needed right now) from them with "$" sign.
# and we can use those variables in scripts to customize scripts behavior.
# by default variable written in CAPS. And to get variable value you need to use $ before variable name. 
echo "Display some environment variables"
echo "======================================="
echo "Hello (env \$USER) $USER" # character $ escaped with \ to print correctly
echo "your home dir is: $HOME"
echo ""
echo ""


# 5 - you can set and use you own variables. To make it write variable name (without spaces) than "=" sign and variable value. All without spaces! (varname=varvalue)
# if you have spaces in variable value - place value in quotes ""
# And to get variable value you need to use $ before variable name.
MYNAME="Johnathan the III"
echo "Own variables"
echo "======================================="
echo "Hello $MYNAME" # character $ escaped with \ to print correctly
echo 'Hello $MYNAME' # text prints as is with all special characters
echo ""
TODAYSDATE=date # the value of TODAYSDATE will be date
echo "Today is: $TODAYSDATE"
TODAYSDATE=`date` # the value of TODAYSDATE will be RESULT of date command
echo "Today is: $TODAYSDATE"
#echo ""
#LSDIR=`ls`
#echo "Directory listing: $LSDIR"
#echo "Directory listing: `ls`"
#echo "Directory listing:"`ls`
echo ""
echo ""


# 6 - special reserved variable names $0 $1 $2.... 
# when you run a script you can run with parameters. first of all type a script name then space then first parameter, then space then 2-nd parameter, and so on.
# parameters must be separated with spaces. 
# if your parameter contains spaces - write it in quotes
# example: script_name parameter_1 "parameter two" and so on. 
# script can get those parameters thru special variable names like $0 $1 $2.
# $0 - returns script name itself, $1 - returns first parameter value, $2 - returns second parameter value, and so on. 
echo "Parameter variables"
echo "======================================="
echo "Script name is: $0"
echo "Parameter 1 is: $1" 
echo "Parameter 2 is: $2"
echo ""
echo ""


# 7 - user input values
# you can ask user to input some value and the you can use it as normal/regular variable
# read command
echo "User input variables"
echo "======================================="
echo "Enter your name"
read USERNAME
echo "Enter your age"
read USERAGE
echo "Hello $USERNAME! You are $USERAGE years old." 
echo ""
echo ""


# 8 - we can use simple mathematical expressions in scripts. 
# shell interprets some symbols like special characters, there for they should be escaped with "\" symbol 
echo "Arithmetical expressions in scripts"
echo "======================================="
echo "1 + 1 = `expr 1 + 1`"
echo "1 + 1 = "`expr 1 + 1`
echo "1 * 1 = `expr 1 \* 1`"
echo "1 * 1 = "`expr 1 \* 1`
echo "2 + 2 * 2 = "`expr 2 + 2 \* 2`
echo "(2 + 2) * 2 = "
expr \( 2 + 2 \) \* 2 # or without backticks but with new line
echo ""
# we can use existing variables to calculate or to "convert" them
echo "You are `expr $USERAGE \* 52` weeks old"
echo "If you want to live up to 100 years, so you have left `expr 5200 - $USERAGE \* 52` weeks"
echo ""
echo ""


# 9 - Command Substitution
# if we need to reuse some of the code/text inside the script 
# one approach for this is variables, but we can use other approach for this task.
# we can write code once with some short name and reuse it as many times as we need it.
# in terms of bash it calls "alias" and in modern languages it calls "macros"
# example: alias begins with predefined word "alias"...
# alias aliasname="COMMAND that will be inserted when you use aliasname in code"
# aliasname becomes new command and to get result of this command you need to use backticks
# but here is one trick:
# by default aliases has to be written in .bash_rc or .bash_profile file inside you home directory
# and by default they roll-out ONLY during LOGIN process.
# to execute bash script it starts new sub-shell and by default aliases are not expand at sub-shells as there is no login process.
# to "fix" it we can use shopt command
echo "Alias Command Substitution"
echo "======================================="
shopt -s expand_aliases
# lets change date command output format
alias  TODAYIS="date +%Y-%m-%d--%H-%M-%S"
echo "Today is: `TODAYIS`" # using alias direct in echo
TODAY=`TODAYIS`           # using alias for variable
echo "Today is: $TODAY"
echo ""
echo ""


# 10 - variable types (Implicit vs. Explicit Definition)
# by default variables is implicitly determine by its value. integer with number, string with sting
# to declare/undeclare variable Explicitly or to view variable type use "declare" command
# shell automatically try to convert Implicitly defined variables to type that expression expect
echo "Variable types"
echo "======================================="
IMPLICITVAR=4
declare -p IMPLICITVAR # view var type 
IMPLICITVAR2="string"
declare -p IMPLICITVAR2 # view var type 
# IMPLICITVAR and IMPLICITVAR2 has the same type - string
# but when we try to use them in some expressions some of can be converted
echo "`expr 5 + $IMPLICITVAR`"  # will convert var to integer as expression expects
echo "`expr 5 + $IMPLICITVAR2`" # will NOT convert var to integer because it can't
# implicit declaration gives us ability to change value and TYPE automatically over time
IMPLICITVAR="new string"
declare -p IMPLICITVAR # view var type 
echo ""
declare -i EXPLICITVAR=4 # declare var as integer
declare -p EXPLICITVAR # view var type 
# with explicitly declared variables with TYPE there is no ability to change type automatically
EXPLICITVAR=23 # i can reassign new value with same type (integer in this example)
declare -p EXPLICITVAR # view var type 
EXPLICITVAR="explicit string" # this will throw an error because i can not reassign new value with other type (string in this example)
declare -p EXPLICITVAR # view var type - it will be the same as declared
echo ""
# if declare variable without type flag - its equal to implicit declaration
declare EXPLICITVAR2=4 # declare var as integer
declare -p EXPLICITVAR2 # view var type 
# with explicitly declared variables with TYPE there is no ability to change type automatically
EXPLICITVAR2=23 # i can reassign new value with same type (integer in this example)
declare -p EXPLICITVAR2 # view var type 
EXPLICITVAR2="explicit string" # now i can reassign new value with other type (string in this example)
declare -p EXPLICITVAR2 # view var type - it will be the same as declared
echo ""
declare +i EXPLICITVAR=4 # undeclare var type
declare -p EXPLICITVAR # view var type 
EXPLICITVAR="explicit string" # now i can reassign new value with other type (string in this example)
declare -p EXPLICITVAR # view var type
echo ""
declare -r READONLYVAR="String, that can not be overwritten" # undeclare var type
declare -p READONLYVAR # view var type 
READONLYVAR="explicit string" # can not be overwritten
declare -p READONLYVAR # view var type
declare +r READONLYVAR # can not be undeclared
declare -p READONLYVAR # view var type 
# "declare -r" is equal to "readonly"
readonly READONLYVAR2="String, that can not be overwritten" # undeclare var type
declare -p READONLYVAR2 # view var type 
echo ""
echo ""


# 11 - arrays
echo "Arrays"
echo "======================================="
NEWARRAY=("first" "Second" "Third") # array elements in quotes space separated
echo ${NEWARRAY[0]}
echo ${NEWARRAY[1]}
echo ${NEWARRAY[2]}
echo ""
echo "print all elements at once"
echo ${NEWARRAY[*]}
echo ""
echo "add forth element and print all at once"
NEWARRAY[3]="Fourth"
echo ${NEWARRAY[*]}
echo ""
echo "print all element one by one with for loop"
#NEWARRAY2=(....
COUNT=0
for INDEX in ${NEWARRAY[@]}; # @ - special character in array that represents "all elements in array"
do
	echo "Processing Element: ${NEWARRAY[COUNT]}"
	COUNT="`expr $COUNT + 1`"
done
echo ""
echo ""


# make some pause before exit
echo "press ENTER to exit"
read
