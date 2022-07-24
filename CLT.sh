#!/bin/bash
# CLT.sh
# ~/Command Line Test/CLT.sh

#--------------------------------Welcome--------------------------------#

function welcome
{
	clear
	echo "-----Welcome To Command Line Test By Aditya-----"
	echo "Login/Register"
	echo "1. Sign in"
	echo "2. Sign up"
	echo "3. Exit"
	echo "Note: Script Exit on Timeout."
	read -p "Please choose your option: " opt
	if [[ $opt -eq 1 ]]
	then
		sign_in
	else
		if [[ $opt -eq 2 ]]
		then
			sign_up
		else
			if [[ $opt -eq 3 ]]
			then
				exit 0
			else
				echo "Invalid Option. Choose a correct option..."
				welcome
			fi
		fi
	fi
}

#--------------------------------Authentication--------------------------------#

function authentication
{
	clear
	echo "-----Sign in-----"
	read -p "Enter Your Username: " username
	read -sp "Enter Your Password: " password
	if [[ $username -eq "Aditya" ]] && [[ $password -eq "1234" ]]
	then
		log_in
	else
		echo -e "\nInvalid Credentials. Try Again After 10 SEC..."
		countdown
		clear
		authentication
	fi
}

#--------------------------------Sign in--------------------------------#

function sign_in
{	
	authentication
	clear
	echo "Welcome To Your Test"
	echo "1. Take Test"
	echo "2. View Test"
	echo "3. Back"
	read -p "Please choose your option: " op
	if [[ $op -eq 1 ]]
	then
		take_test
	else
		if [[ $op -eq 2 ]]
		then
			view_test
		else
			if [[ $op -eq 3 ]]
			then
				welcome
			else
				echo "Invalid Option. Try Again..."
				sleep 1
				sign_in
			fi
		fi
	fi
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
	clear
	echo "-----Sign Up and Register-----"
	read -p "Enter Your Name: " name
	read -p "Enter Your Username: " user
	read -p "Enter Your Password: " pass
	read -sp "Confirm Your Password: " cpass
	if [[ $pass -eq $cpass ]]
	then
		echo -e "\nYou're successfully signed up. Please Wait..."
		sleep 1
		echo -e "\nWe are redirecting you to Sign in"
		sleep 1
		loading
		sign_in
	else
		echo -e "\nPassword Mismatch. Try Again After 10 SEC"
		countdown
		sign_up
	fi
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
