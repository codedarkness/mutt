#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.xyz
# https://github.com/codedarkness
# -----------------------------------------------------------------
#
#        FILE: mutt-install.sh
#       USAGE: ./mutt-install.sh
#
# DESCRIPTION: install and configured mutt email client
#
#      AUTHOR: DarknessCode
#       EMAIL: achim@darknesscode.xyz
#
#     CREATED: 05-30-20 6:27
#
# -----------------------------------------------------------------

install-mutt() {
	config-files/systems/install-mutt.sh
}

edit-muttar() {
	vim $HOME/.muttrc
}

readme() {
	less config-files/readme
}

press_enter() {
	echo ""
	echo -n " Press Enter To Continue"
	read
	clear
}

incorrect_selection() {
	echo " Incorrect selection! try again"
}

until [ "$selection" = "0" ]; do
	clear
	echo ""
	echo " DarknessCode"
	echo "                  _   _    "
	echo "                 | | | |   "
	echo "  _ __ ___  _   _| |_| |_  "
	echo " | '_ ' _ \| | | | __| __| "
	echo " | | | | | | |_| | |_| |_  "
	echo " |_| |_| |_|\__,_|\__|\__| "
	echo ""
	echo " mutt a terminal based email client"
	echo ""
	echo " 1 - Install"
	echo " 2 - Edit muttrc"
	echo " 3 - Readme (instructions)"
	echo ""
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install-mutt ;;
		2) clear; edit-muttar  ;;
		3) clear; readme      ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
