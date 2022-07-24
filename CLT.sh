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
		if [[ $username == "" ]] && [[ $password == "" ]]
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
		function take_test
		{
			echo "This is working"
		}
		function view_test
		{
			echo "This is also working"
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
		sleep 1
		clear
		echo "loading"
		sleep 1
		clear
		echo "loading."
		sleep 1
		clear
		echo "loading.."
		sleep 1
		clear
		echo "loading..."
		sleep 1
		clear
		echo "loading"
		sleep 1
		clear
		echo "loading."
		sleep 1
		clear
		echo "loading.."
		sleep 1
		clear
		echo "loading..."
		clear
		log_in
	else
		echo -e "\nPassword Mismatch. Try Again..."
	fi
	}
	function countdown
	{
		clear
		echo "00:00:10"
		sleep 1
		clear
		echo "00:00:09"
		sleep 1
		clear
		echo "00:00:08"
		sleep 1
		clear
		echo "00:00:07"
		sleep 1
		clear
		echo "00:00:06"
		sleep 1
		clear
		echo "00:00:05"
		sleep 1
		clear
		echo "00:00:04"
		sleep 1
		clear
		echo "00:00:03"
		sleep 1
		clear
		echo "00:00:02"
		sleep 1
		clear
		echo "00:00:01"
		sleep 1
		clear
	}
#fi

welcome
if [[ $opt -eq 1 ]]
then
        clear
	log_in
	if [[ $op -eq 1 ]]
	then
		clear
		take_test
	else
		if [[ $op -eq 2 ]]
		then
			clear
			view_test
		else
			if [[ $op -eq 3 ]]
			then
				clear
				welcome
			else
				echo "Invalid Option. Choose a correct option."
				sleep 1
				echo "You are logged Out"
				sleep 1
				echo "Please, Login Again after 10 sec"
				sleep 1
				countdown
				sleep 1
				log_in
			fi
		fi
	fi
else
	if [[ $opt -eq 2 ]]
	then
        	clear
		sign_up
	else
		exit 0
	fi

fi
