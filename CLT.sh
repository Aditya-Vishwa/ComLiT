#!/bin/bash
# CLT.sh
# ~/Command Line Test/CLT.sh

clear
echo "-----Welcome To Command Line Test By Aditya-----"
echo "Login/Register"
echo "1. Sign in"
echo "2. Sign up"
echo "3. Exit"
sleep 2
echo "Note: Script Exit on Timeout"
sleep 2
echo "Please choose your option"
read opt
if [[ $opt -eq 1 ]]
then
	clear
	echo "-----Login-----"
	echo "Enter Your Username: "
	read username
	echo "Enter Password: "
	read password
	if [[ $username -eq "Monica" ]] && [[ $password -eq "MaagoKalikaa1234" ]]
	then
		clear
		echo "Welcome To Your Test"
		echo "1. Take Test"
		echo "2. View Test"
		echo "3. Back"
	else
		echo "Invalid Credentials"
	fi
fi
