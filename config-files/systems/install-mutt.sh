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
#        FILE: install-mutt.sh
#       USAGE: ./install-mutt.sh | sub menu of mutt-install.sh
#
# DESCRIPTION: install mutt in arch and debian based systems
#
#      AUTHOR: DarknessCode
#       EMAIL: achim@darknesscode.xyz
#
#     CREATED: 05-30-20 6:57
#
# -----------------------------------------------------------------

install-mutt() {
	echo ""
	echo " Getting ready to install mutt"
	echo " Arch Linux | Debian | Void Linux"
	echo ""
	sleep 2;

	while true; do
		read -p " Install mutt [y - n] : " yn
		case $yn in
			[Yy]* )
				if ! location="$(type -p "mutt")" || [ -z "mutt" ]; then

					# check if pacman is installed
					if which pacman > /dev/null 2>&1; then

						sudo pacman -S --noconfirm mutt

					# check if apt is installed
					elif which apt > /dev/null 2>&1; then

						sudo apt install -y mutt

					# check if xbps is installed
					elif which xbps-install > /dev/null 2>&1; then

						sudo xbps-install -Sy mutt

					else

						echo " Your system is not compatible with this script..."
					fi

					else
						echo " Nothing to do! mutt is installed in your System"
				fi ; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done

	echo ""
}

config-files() {
	echo ""
	echo " Copy configuration files and new directories"
	echo ""
	sleep 2

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

	cp -af config-files/configs/custom $HOME/.config/mutt/accounts/ &&
	cp -af config-files/configs/gmail $HOME/.config/mutt/accounts/ &&
	cp -af config-files/configs/hotmail $HOME/.config/mutt/accounts/ &&
	cp -af config-files/configs/yahoo $HOME/.config/mutt/accounts/ &&
	echo " accounts files have been copied" || echo " Sorry is not you!!"
	echo ""

	# colors
	## colors directory
	### Check for dir, if not found create it using the mkdir ###
	colordir="$HOME/.config/mutt/colors"
	[ ! -d "$colordir" ] && mkdir -p "$colordir" &&
	echo " colors directory was created" || echo " $colorsdir already exist!"
	echo ""

	cp -af config-files/configs/color_00 $HOME/.config/mutt/colors/ &&
	cp -af config-files/configs/color_01 $HOME/.config/mutt/colors/ &&
	cp -af config-files/configs/color_02 $HOME/.config/mutt/colors/ &&
	cp -af config-files/configs/color_03 $HOME/.config/mutt/colors/ &&
	echo " color have been copied" || echo " Sorryyyyyy!"
	echo ""

	cp -af config-files/configs/muttrc $HOME/.muttrc &&
	echo " New muttrc has been copied" || echo " Something is wrong!"
	echo ""
}

setup-yahoo() {
	echo ""
	echo " Setting up Yahoo account"
	echo " Follow the instructions to setup the account"
	echo ""
	sleep 2

	read -p " Which is your name (show in email) : " choice;
	sed -i 's/set realname = "user-name"/set realname = "'$choice'"/g' $HOME/.config/mutt/accounts/yahoo &&
	echo " your name has been saved" || echo " Hummmm what is wrong with you!"
	echo ""

	read -p " Which is your email address : " choice;
	sed -i 's/set from = "user-email"/set from = "'$choice'"/g' $HOME/.config/mutt/accounts/yahoo &&
	sed -i 's/set imap_user = "useremail@yahoo.com"/set imap_user = "'$choice'"/g' $HOME/.config/mutt/accounts/yahoo &&
	echo " email address was added to yahoo account" || echo " Mhummmmm!"
	echo ""

	read -p " Which is your yahoo username : " choice;
	sed -i 's/set smtp_url = "smtps://useremail@smtp.mail.yahoo.com:465"/set smtp_url = "smtps://'$choice'@smtp.mail.yahoo.com:465"/g' $HOME/.config/mutt/accounts/yahoo &&
	echo " username was added to smtp_url" || echo " it's not you!! but there's a problem"
	echo ""

	read -p " Which is your password : " choice;
	sed -i 's/set smtp_pass = "user-password"/set smtp_pass = "'$choice'"/g' $HOME/.config/mutt/accounts/yahoo &&
	sed -i 's/set imap_pass = "user-password"/set imap_pass = "'$choice'"/g' $HOME/.config/mutt/accounts/yahoo &&
	echo " your password has been saved" || echo " We have a problem!"
	echo ""

	echo " Your yahoo accoun is setting up!"
	echo ""
}

setup-gmail() {
	echo ""
	echo " Setting up Gmail account"
	echo " Follow the instructions to setup the account"
	echo ""
	sleep 2

	read -p " Which is your name (show in email) : " choice;
	sed -i 's/set realname = "user-name"/set realname = "'$choice'"/g' $HOME/.config/mutt/accounts/gmail  &&
	echo " your name has been saved" || echo " Hummmm what is wrong with you!"
	echo ""

	read -p " Which is your email address : " choice;
	sed -i 's/set from = "user-email"/set from = "'$choice'"/g' $HOME/.config/mutt/accounts/gmail &&
	sed -i 's/set imap_user = "useremail@gmail.com"/set imap_user = "'$choice'"/g' $HOME/.config/mutt/accounts/gmail &&
	sed -i 's/set smtp_url = "smtps://useremail@gmail.com@smtp.gmail.com:465"/set smtp_url = "smtps://'$choice'@smtp.gmail.com:465"/g' $HOME/.config/mutt/accounts/gmail &&
	echo " email address was added to gmail account" || echo " Mhummmmm!"
	echo ""

	read -p " Which is your password : " choice;
	sed -i 's/set smtp_pass = "user-password"/set smtp_pass = "'$choice'"/g' $HOME/.config/mutt/accounts/gmail &&
	sed -i 's/set imap_pass = "user-password"/set imap_pass = "'$choice'"/g' $HOME/.config/mutt/accounts/gmail &&
	echo " your password has been saved" || echo " We have a problem!"
	echo ""

	echo " Your Gmail account is setting up!"
	echo ""
}

setup-hotmail() {
	echo ""
	echo " Setting up Hotmail account"
	echo " Follow the instructions to setup the account"
	echo ""
	sleep 2

	read -p " Which is your name (show in email) : " choice;
	sed -i 's/set realname = "user-name"/set realname = "'$choice'"/g' $HOME/.config/mutt/accounts/hotmail &&
	echo " your name has been saved" || echo " Hummmm what is wrong with you!"
	echo ""

	read -p " Which is your email address : " choice;
	sed -i 's/set from = "user-email"/set from = "'$choice'"/g' $HOME/.config/mutt/accounts/hotmail &&
	sed -i 's/set imap_user = "useremail@hotmail.com"/set imap_user = "'$choice'"/g' $HOME/.config/mutt/accounts/hotmail &&
	sed -i 's/set smtp_url = "smtps://useremail@hotmail.com@smtp.mail.outlook.com:587"/set smtp_url = "smtps://'$choice'@smtp.mail.outlook.com:587"/g' $HOME/.config/mutt/accounts/hotmail &&
	echo " email address was added to hotmail (outlook) account" || echo " Mhummmmm!"
	echo ""

	read -p " Which is your password : " choice;
	sed -i 's/set smtp_pass = "user-password"/set smtp_pass = "'$choice'"/g' $HOME/.config/mutt/accounts/hotmail &&
	sed -i 's/set imap_pass = "user-password"/set imap_pass = "'$choice'"/g' $HOME/.config/mutt/accounts/hotmail &&
	echo " your password has been saved" || echo " We have a problem!"
	echo ""

	echo " Your Hotmail account is setting up!"
	echo ""
}

custom-account() {
	echo ""
	echo " Setting up a custom account"
	echo " Follow the instructions to setup the account"
	echo ""
	sleep 2

	read -p " Which is your name (show in email) : " choice;
	sed -i 's/set realname = "real-name"/set realname = "'$choice'"/g' $HOME/.config/mutt/accounts/custom &&
	echo " your name has been saved" || echo " Hummmm what is wrong with you!"
	echo ""

	read -p " Which is your email address : " choice;
	sed -i 's/set from = "real-email"/set from = "'$choice'"/g' $HOME/.config/mutt/accounts/custom &&
	echo " email address was ben setup" || echo " We have a problem"
	echo ""

	read -p " Which is your imap user : " choice;
	sed -i 's/set imap_user = "imap-user"/set imap_user = "'$choice'"/g' $HOME/.config/mutt/accounts/custom &&
	echo " imap user was added to the account" || echo " Mhummmmm!"
	echo ""

	read -p " Which is the imap address : " choice;
	sed -i 's/set folder = "imap://customeimap:993"/set imap_user = "imap://'$choice':993"/g' $HOME/.config/mutt/accounts/custom &&
	echo " imap folder was added to the account" || echo " Mhummmmm!"
	echo ""

	read -p " Which is your custom smtp : " choice;
	sed -i 's/set smtp_url = "smtps://customersmtp:465"/set smtp_url = "smtps://'$choice':465"/g' $HOME/.config/mutt/accounts/custom &&
	echo " The smtp url was added to the account" || echo " it's not you!! but there's a problem"
	echo ""

	read -p " Which is your password : " choice;
	sed -i 's/set smtp_pass = "user-password"/set smtp_pass = "'$choice'"/g' $HOME/.config/mutt/accounts/custom &&
	sed -i 's/set imap_pass = "user-password"/set imap_pass = "'$choice'"/g' $HOME/.config/mutt/accounts/custom &&
	echo " your password has been saved" || echo " We have a problem!"
	echo ""

	echo " Your custom accoun is setting up!"
	echo ""
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
		1) clear; install-mutt   ; press_enter ;;
		2) clear; config-files   ; press_enter ;;
		3) clear; setup-yahoo    ; press_enter ;;
		4) clear; setup-gmail    ; press_enter ;;
		5) clear; setup-hotmail  ; press_enter ;;
		6) clear; custom-account ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
