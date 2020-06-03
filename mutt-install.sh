#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.com
# https://github.com/codedarkness
# -----------------------------------------------------------------
#
#        FILE: mutt-install.sh
#       USAGE: ./mutt-install.sh
#
# DESCRIPTION: install and configured mutt email client
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 05-30-20 6:27
#
# -----------------------------------------------------------------

arch-based() {
	config-files/arch-based.sh
}

debian-based() {
	config-files/debian-based.sh
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
	echo " ---------------------------------"
	echo " ### mutt/neomutt email client ###"
	echo " ---------------------------------"
	echo ""
	echo " 1 - Install in Arch Based"
	echo " 2 - Install in Debian Based"
	echo " 3 - Edit muttrc"
	echo " 4 - Readme (instructions)"
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; arch-based   ;;
		2) clear; debian-based ;;
		3) clear; edit-muttar  ;;
		4) clear; readme      ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
