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
#        FILE: install-mutt.sh
#       USAGE: ./install-mutt.sh | sub menu of mutt-install.sh
#
# DESCRIPTION: install mutt in arch and debian based systems
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

	while true; do
		read -p " Install mutt [y - n] : " yn
		case $yn in
			[Yy]* )
				if ! location="$(type -p "mutt")" || [ -z "mutt" ]; then

					# check if pacman is installed
					if which pacman > /dev/null; then

						sudo pacman -S --noconfirm --needed mutt

					fi

					# check if apt is installed
					if which apt > /dev/null; then

						sudo apt install -y mutt

					fi

				else
					echo " nothing to do!"
				fi; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
}

config-files() {
	echo ""
	echo " Copy configuration files and new directories"
	echo ""
	sleep 2;

	## mutt directory
	### Check for dir, if not found create it using the mkdir ###
	muttdir="$HOME/.config/mutt"
	[ ! -d "$muttdir" ] && mkdir -p "$muttdir" &&
	echo " mutt directory was created" || echo " $muttdir already exist!"
	echo ""

	## headers directory
	### Check for dir, if not found create it using the mkdir ###
	headdir="$HOME/.config/mutt/cache/headers"
	[ ! -d "$headdir" ] && mkdir -p "$headdir" &&
	echo " headers directory was created" || echo " $headdir already exist!"
	echo ""

	## bodies directory
	### Check for dir, if not found create it using the mkdir ###
	bodiesdir="$HOME/.config/mutt/cache/bodies"
	[ ! -d "$bodiesdir" ] && mkdir -p "$bodiesdir" &&
	echo " bodies directory was created" || echo " $bodiesdir already exist!"
	echo ""

	cp -af config-files/configs/certificates $HOME/.config/mutt &&
	echo " certificates files has been copies" || echo " Error in your system!"
	echo ""

	cp -af config-files/configs/keybindings $HOME/.config/mutt &&
	echo " keybindings file has been copied" || echo " Whoopssss!"
	echo ""

	# accounts files
	## accounts directory
	### Check for dir, if not found create it using the mkdir ###
	accdir="$HOME/.config/mutt/accounts"
	[ ! -d "$accdir" ] && mkdir -p "$accdir" &&
	echo " bodies directory was created" || echo " $accdir already exist!"
	echo ""

	cp -af config-files/configs/custom $HOME/.config/mutt/accounst/ &&
	cp -af config-files/configs/gmail $HOME/.config/mutt/accounst/ &&
	cp -af config-files/configs/hotmail $HOME/.config/mutt/accounst/ &&
	cp -af config-files/configs/yahoo $HOME/.config/mutt/accounst/ &&
	echo " accounts files have been copied" || echo " Sorry is not you!!"

	cp -af config-files/configs/muttrc $HOME/.muttrc &&
	echo " New muttrc has been copied" || echo " Something is wrong!"
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
	echo "  _           _        _ _ __  __       _   _    "
	echo " (_)         | |      | | |  \/  |     | | | |   "
	echo "  _ _ __  ___| |_ __ _| | | \  / |_   _| |_| |_  "
	echo " | | '_ \/ __| __/ _' | | | |\/| | | | | __| __| "
	echo " | | | | \__ \ || (_| | | | |  | | |_| | |_| |_  "
	echo " |_|_| |_|___/\__\__,_|_|_|_|  |_|\__,_|\__|\__| "
	echo ""
	echo " install and  setup mutt in Arch and Debian besed systems"
	echo ""
	echo " 1 - Install Mutt"
	echo " 2 - Copy config files (new installations)"
	echo ""
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
