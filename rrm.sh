#!/bin/bash - 
#===============================================================================
#
#          FILE: rrm.sh 
# 
#         USAGE:  rrm.sh foo
# 
#   DESCRIPTION:  eg. rrm.sh .svn  // delete all .svn folders recursively.
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

function usage () {
    echo -ne "\n${COLOR_BRIGHT_WHITE}rrm.sh, a small tool, be used for recursivly delete specified file or folder.${COLOR_NORMAL}\n"
    echo -ne "\nUsage :\n"
    echo -ne "\t `basename $0` filename [ or foldername ]\n"
    echo -ne "\n\t `basename $0` .svn   < will be delete all .svn folder> \n\n"
}

if [ $# -lt 1 ]; then
    usage
    exit 1
fi 

echo -e "\n${COLOR_BOLD_RED}+------------------------------------------------------------------+${COLOR_NORMAL}"
find ./ -name "$1" | grep "$1$"
echo -e "${COLOR_BOLD_RED}+------------------------------------------------------------------+${COLOR_NORMAL}\n"

echo -ne "\nThe files listed above will be delete.\n\n"

read -p "Continue ? [Y/N] : " answer

if [ $answer != "y" -a $answer != "Y" ]; then
    echo -e "\n${COLOR_GREEN}Exit${COLOR_NORMAL}\n"
    exit 0
fi

find ./ -name "$1" | grep "$1$" | sed -e 's/^/rm -rf /g' | /bin/bash

echo -e "\n${COLOR_GREEN}Success ${COLOR_BOLD_RED} ${CHECK_MARK} ${COLOR_NORMAL}\n"

exit 0
