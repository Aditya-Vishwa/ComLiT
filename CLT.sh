#!/bin/bash
# CLT.sh
# ~/Command Line Test/CLT.sh

clear

#--------------------------------Welcome--------------------------------#

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

#--------------------------------Authentication--------------------------------#

function authentication
{
	echo "-----Login-----"
	read -p "Enter Your Username: " username
	read -sp "Enter Your Password: " password
}

#--------------------------------Login--------------------------------#

function log_in
{	
	echo "Welcome To Your Test"
	echo "1. Take Test"
	echo "2. View Test"
	echo "3. Back"
	read -p "Please choose your option: " op
}

#--------------------------------Take Test--------------------------------#

function take_test
{
	echo "This is working"
}

#--------------------------------View Test--------------------------------#

function view_test
{
	echo "This is also working"
}

#--------------------------------Sign Up--------------------------------#

function sign_up
{
	echo "-----Sign Up and Register-----"
	read -p "Enter Your Name: " name
	read -p "Enter Your Username: " user
	read -p "Enter Your Password: " pass
	read -sp "Confirm Your Password: " cpass
}

#--------------------------------Infinite Loading--------------------------------#

function iloading
{
	while true;
	do
    	# Frame #1
    	printf "\r< Loading." 
    	sleep 0.5
    	# Frame #2 
    	printf "\r> Loading.." 
    	sleep 0.5 
		# Frame #3
    	printf "\r> Loading..." 
    	sleep 0.5
	done
}

#--------------------------------Loading--------------------------------#

function loading
{
	clear
	echo "loading"
	sleep 0.5
	clear
	echo "loading."
	sleep 0.5
	clear
	echo "loading.."
	sleep 0.5
	clear
	echo "loading..."
	sleep 0.5
	clear
}

#--------------------------------Countdown--------------------------------#
	
function countdown
{
 hour=00
 min=00
 sec=10
        while [ $hour -ge 0 ]; do
                 while [ $min -ge 0 ]; do
                         while [ $sec -ge 0 ]; do
                                 echo -ne "$hour:$min:$sec\033[0K\r"
                                 let "sec=sec-1"
                                 sleep 1
                         done
                         sec=59
                         let "min=min-1"
                 done
                 min=59
                 let "hour=hour-1"
         done
}

#--------------------------------Main--------------------------------#

welcome
if [[ $opt -eq 1 ]]
then
	clear
	authentication
	if [[ $username=="" && $password=="" ]]
	then
		clear	
		log_in
	else
		echo "Invalid Credentials. Please Try Again..."
		authentication
	fi
else
	if [[ $opt -eq 2 ]]
	then
		clear
		sign_up
	else
		if [[ $opt -eq 3 ]]
		then
			exit 0
		else
			echo "Invalid Option. Try Again after 10 sec..."
			countdown
			clear
			welcome
		fi
	fi
fi
