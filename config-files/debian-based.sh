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
#        FILE: arch-based.sh
#       USAGE: ./arch-based.sh | sub menu of mutt-install.sh
#
# DESCRIPTION: install mutt in arch based systems
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 05-30-20 6:57
#
# -----------------------------------------------------------------

install-mutt() {
	echo ""
	echo " Getting ready to install mutt"
	echo ""
	sleep 2;

	dpkg -l | grep  mutt &&
	echo " ### mutt is install in your system" ||
	sudo apt install -y  mutt
	echo ""
}

config-files() {
	echo ""
	echo " Copy configuration files and creating some nuew directories"
	echo ""
	sleep 2;

	cp -ar config-files/muttrc ~/.muttrc &&
	echo " New muttrc has been copied" || echo " Something is wrong!"
	echo ""

	cp -ar config-files/mutt ~/.config/ &&
	echo " New config files for mutt has been copied" || echo " Upsss!"
	echo ""

	mkdir ~/.config/mutt/cache/headers &&
	echo " Headers directory has been created" || echo " Something is broken"
	echo ""

	mkdir ~/.config/mutt/cache/bodies &&
	echo " Bodies directory has been created" || echo " Wha't wrong with you!"
	echo ""
}

setup-yahoo() {
	vim $HOME/.config/mutt/accounts/yahoo
}

setup-gmail() {
	vim $HOME/.config/mutt/accounts/gmail
}

setup-hotmail() {
	vim $HOME/.config/mutt/accounts/hotmial
}

custom-account() {
	vim $HOME/.config/mutt/accounts/custom
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
	echo " 	                _   _   _____       _     _              "
	echo "                 | | | | |  __ \     | |   (_)             "
	echo "  _ __ ___  _   _| |_| |_| |  | | ___| |__  _  __ _ _ __   "
	echo " | '_ ' _ \| | | | __| __| |  | |/ _ \ '_ \| |/ _' | '_ \  "
	echo " | | | | | | |_| | |_| |_| |__| |  __/ |_) | | (_| | | | | "
	echo " |_| |_| |_|\__,_|\__|\__|_____/ \___|_.__/|_|\__,_|_| |_| "
	echo ""
	echo " install and  setup mutt"
	echo ""
	echo " 1 - Install Mutt"
	echo " 2 - Copy config files (new installations)"
	echo " 3 - Set up yahoo account"
	echo " 4 - Set up gmail account"
	echo " 5 - Set up hotmail account"
	echo " 6 - Set up custom account"
	echo ""
	echo " 0 - Exit"
	echo ""
	echo " Note:"
	echo " This kind of setup is for a personal computer use"
	echo " Becarfull with your passwords"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install-mutt    ; press_enter ;;
		2) clear; copy-files      ; press_enter ;;
		3) clear; setup-yahoo    ;;
		4) clear; setup-gmail    ;;
		5) clear; setup-hotmail  ;;
		6) clear; custom-account ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
