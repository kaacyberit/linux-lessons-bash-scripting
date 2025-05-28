#!/bin/bash
# shall expansions
clear
echo "echo sh{ot,oot,ort} - " sh{ot,oot,ort}
echo "echo st{il,al}l - " st{il,al}l
echo "echo \$HOME == echo ~ - " ~
echo "pwd == echo ~+ - " ~+
echo "old pwd == echo ~- - " ~-
echo ""
echo "print enviroment vars started with HO: echo \"\${!HO*}\": "
echo "${!HO*}" 
echo ""
echo "two variants set and dislay variable at the same time:"
echo "CARNAME=audi && echo \$CARNAME" 
echo "or"
echo "echo \"\${CARNAME:=audi}\":"
echo "${CARNAME:=audi}"
echo ""
echo "fast way to use \"expr\" is: echo \"\$[ 2 * 2 ]\":"
echo "$[ 2 * 2 ]"
# make some pause before exit
echo ""
echo "press ENTER to exit"
read

