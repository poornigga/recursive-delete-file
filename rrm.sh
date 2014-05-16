#!/bin/bash - 
#===============================================================================
#
#          FILE:  rrm 
# 
#         USAGE:  ./rrm.sh foo
# 
#   DESCRIPTION:  e.g. ./rrm.sh .svn  // delete all .svn folders recursive.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  bigdog() 
#       COMPANY: 
#       CREATED: 2012/06/07 15时52分04秒 CST
#      REVISION:  ---
#===============================================================================
set -o nounset                              # Treat unset variables as an error

COLOR_BRIGHT_WHITE="\033[1;97m"
COLOR_BOLD_RED="\033[1;31m"
COLOR_GREEN="\033[0;32m"
COLOR_NORMAL="\033[0m"
CHECK_MARK="\xe2\x9c\x93"
CLEAR_SCREEN="\x1b[H\x1b[2J"


cmdname=`basename $0`

function usage () {
<<<<<<< HEAD
    echo -ne "\n${COLOR_BRIGHT_WHITE}rrm.sh, a small tool, be used for recursivly delete specified file or folder.${COLOR_NORMAL}\n"
    echo -ne "\nUsage :\n"
    echo -ne "\t `basename $0` filename [ or foldername ]\n"
    echo -ne "\n\t `basename $0` .svn   < will be delete all .svn folder> \n\n"
=======
    echo -ne "${CLEAR_SCREEN}"
    echo -ne "\n${COLOR_BRIGHT_WHITE}${cmdname}, a small tool, be used for recursivly delete specified file or folder.${COLOR_NORMAL}\n"
    echo -ne "\nUSAGE :\n"
    echo -ne "\t${COLOR_BOLD_RED} ${cmdname}${COLOR_GREEN} filename [ or foldername ]${COLOR_NORMAL}\n"
    echo -ne "\n\t ${COLOR_BOLD_RED}${cmdname} ${COLOR_GREEN}.svn ${COLOR_NORMAL}  < will be delete all .svn folder recursivly > \n\n"
>>>>>>> 417bada306e30db548545c057f53a3bf95cf3961
}

if [ $# -lt 1 ]; then
    usage
    exit 1
fi 

echo -e "\n${COLOR_BOLD_RED}+------------------------------------------------------------------+${COLOR_NORMAL}"
find ./ -name "$1" | grep "$1$"
echo -e "${COLOR_BOLD_RED}+------------------------------------------------------------------+${COLOR_NORMAL}\n"

count=`find ./ -name "$1" | grep "$1$" | wc -l`
if [ ${count} -eq 0 ]; then
    echo -e "${COLOR_BRIGHT_WHITE}\tNo file will be delete\n"
    echo -e "\n${COLOR_GREEN}Exit${COLOR_NORMAL}\n"
    exit 0
fi

echo -ne "\nThe ["$count" ] files listed above will be delete.\n\n"

read -p "Continue ? [Y/N] : " answer

if [ $answer != "y" -a $answer != "Y" ]; then
    echo -e "\n${COLOR_BOLD_RED}Action cancelled."
    echo -e "\n${COLOR_GREEN}Exit${COLOR_NORMAL}\n"
    exit 0
fi

find ./ -name "$1" | grep "$1$" | sed -e 's/^/rm -rf /g' | /bin/bash

echo -e "\n${COLOR_GREEN}Success ${COLOR_BOLD_RED} ${CHECK_MARK} ${COLOR_NORMAL}\n"
exit 0

