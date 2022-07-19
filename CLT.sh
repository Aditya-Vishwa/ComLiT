#!/bin/bash
# CLT.sh
# ~/Command Line Test/CLT.sh

clear
function welcome
{
	echo "-----Welcome To Command Line Test By Aditya-----"
	echo "Login/Register"
	echo "1. Sign in"
	echo "2. Sign up"
	echo "3. Exit"
	echo "Note: Script Exit on Timeout."
	read -p "Please choose your option: " opt
}
#if [[ $opt -eq 1 ]]
#then
#	clear
	function log_in
	{
		echo "-----Login-----"
		read -p "Enter Your Username: " username
		read -sp "Enter Your Password: " password
		if [[ $username == "Aditya" ]] && [[ $password == "1234" ]]
		then
			clear
			echo "Welcome To Your Test"
			echo "1. Take Test"
			echo "2. View Test"
			echo "3. Back"
			read -p "Please choose your option: " op
		else
			echo -e "\nInvalid Credentials. Try  Again..."
		fi
	}
#fi
#if [[ $opt -eq 2 ]]
#then
#	clear
	function sign_up
	{
		echo "-----Sign Up and Register-----"
		read -p "Enter Your Name: " name
		read -p "Enter Your Username: " user
		read -p "Enter Your Password: " pass
		read -sp "Confirm Your Password: " cpass
	if [[ $pass == $cpass ]]
	then
		clear
		echo "-----You're Successfully Signed Up-----"
		log_in
	else
		echo -e "\nPassword Mismatch. Try Again..."
	fi
	}
#fi

welcome
if [[ $opt -eq 1 ]]
then
        clear
	log_in
else
	if [[ $opt -eq 2 ]]
	then
        	clear
		sign_up
	else
		exit 0
	fi

fi
