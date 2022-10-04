#!/bin/bash
# CLT.sh
# ~/Command Line Test/CLT.sh

#--------------------------------Welcome--------------------------------#

function welcome
{
	clear
	echo "------------------------------------------------"
	echo "|    Welcome To Command Line Test By Aditya    |"
	echo "------------------------------------------------"
	echo "Login/Register"
	echo "1. Sign in"
	echo "2. Sign up"
	echo "3. Exit"
	echo "Note: Script Exit on Timeout."
	read -p "Please choose your option: " opt
	if [[ $opt -eq 1 ]]
	then
		authentication
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

#--------------------------------Creating user.csv && password.csv--------------------------------#

	if [ ! -f "user.csv" ]                    # check if user.csv file exists 
    then
        touch user.csv
    fi

    if [ ! -f "password.csv" ]                # check if password.csv file exists
    then
        touch password.csv
    fi

#--------------------------------Authentication--------------------------------#

function authentication
{
	clear
	echo "------------------------------------------------"
	echo "|                   Sign in                    |"
	echo "------------------------------------------------"
	# read -p "Enter Your Username: " username
	# read -sp "Enter Your Password: " password
	# if [[ $username -eq "Aditya" ]] && [[ $password -eq "1234" ]]
	# then
	# 	log_in
	# else
	# 	echo -e "\nInvalid Credentials. Try Again After 10 SEC..."
	# 	countdown
	# 	clear
	# 	authentication
	# fi

	read -p "Enter the username: " user                        # read the username

    uname=(`cat user.csv`)                                     # retrieve all username and store in array
    uname_len=${#uname[@]}
    pass=(`cat password.csv`)                                  # retrieve all password in encoded format and store in array
    index=""
    for i in `seq 0 $(($uname_len-1))`                         # loop to find if entered username is present in user.csv file                       
    do
    	if [ "$user" = "${uname[$i]}" ]
    	then
            index=$i                                           # save index value of the username matched in file
        fi
    done
    if [ -n "$index" ]                                         # check if index variable is not null meaning user is present
    then
        echo "Username Matched!!!"
        read -sp "Enter your password: " pass1                                               # read password from user
	else
		echo "You are not signed up."
		echo "Please Sign up."
		iloading
		sign_up
	fi

        if [ $pass1 = `echo ${pass[$index]} | base64 --decode` ]    # check if correct password is entered after decoding it from password.csv file
        then
            check=1
            echo -e "\nPassword Matched."
            echo "Signed in successfully!!!"
			sleep 2
			sign_in
		else
			echo -e "\nPlease enter the correct Password.Try again..."
			iloading
			sleep 1
			authentication
		fi
			

}

#--------------------------------Sign in--------------------------------#

function sign_in
{	
	clear
	echo "------------------------------------------------"
	echo "         Welcome to your Test $user         "
	echo "------------------------------------------------"
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
	qbank_lines=`cat questionbank.txt | wc -l`      # store number of lines in question bank file
    for i in `seq 5 5 $qbank_lines`                 # loop to iterate through the question set each of five lines
    do
        clear
        cat questionbank.txt | head -$i | tail -5   # display the question
        for j in `seq 10 -1 1`                      # loop to iterate 10 times in reverse
        do
            echo -e "\r Enter the choice :\e[31m$j \e[0m \c"    # intializing 10 second counter for user to provide the option

            read -t 1 option

            if [ -z "$option" ]                     # check if no option is selection means timeout
            then
                option="e"
            else
                break                               # else break the inner loop
            fi
        done
        echo $option >> user_answer.txt             # store option in a temporary file
        echo "-------------------------"
    done
    clear          
    user_ans=(`cat user_answer.txt`)                # store user selected option in an array
    crrt_ans=(`cat correctanswer.txt`)              # store all the correct answers in an array
    uans_len=${#user_ans[@]}
    count=0
    for i in `seq 0 $(($uans_len-1))`               # loop to check and compare the correct answers ans store in result.txt file
    do
        if [ ${user_ans[$i]} = ${crrt_ans[$i]} ]
        then
                                        echo "correct" >> result.txt
                                        count=$(($count+1))
        elif [ ${user_ans[$i]} = "e" ]
        then
            echo "timeout" >> result.txt
        else
            echo "wrong" >> result.txt
        fi
    done
}

#--------------------------------Result--------------------------------#

echo "-----------------------------------" >> reportcard.txt
                                echo "          Report Card              " >> reportcard.txt
                                echo "-----------------------------------" >> reportcard.txt
                                k=0
                                result=(`cat result.txt`)                      # store contents of result.txt file in an array
                                for i in `seq 5 5 $qbank_lines`                # loop to display the detailed report card to the user after exam
                                do
                                    cat questionbank.txt | head -$i | tail -5 >> reportcard.txt
                                    if [ ${result[$k]} = "correct" ]                                                     # store if answer is correct in green
                                    then
                                        echo -e "\e[32mCorrect Answer!" >> reportcard.txt
                                        echo -e "\e[32mOption Selected: ${user_ans[`echo "$i / 5 - 1" | bc`]}" >> reportcard.txt
                                    elif [ ${result[$k]} = "wrong" ]                                                     # store if answer is wrong in red
                                    then
                                        echo -e "\e[31mWrong Answer!"  >> reportcard.txt
                                        echo -ne "\e[31mOption Selected: ${user_ans[`echo "$i / 5 - 1" | bc`]}, " >> reportcard.txt
                                        echo -e "\e[31mCorrect Option: ${crrt_ans[`echo "$i / 5 - 1" | bc`]}" >> reportcard.txt
                                    else
                                        echo -e "\e[33mTimeout!" >> reportcard.txt                                        # store if timeout in yellow
                                    fi
                                    k=$(($k+1))
                                    echo -e "\e[0m--------------------" >> reportcard.txt
                                done
                                echo "Total Correct Answers: $count out of $uans_len"  >> reportcard.txt                   # store total correct answers by user
                                echo "--------------------" >> reportcard.txt
                                echo "NOTE: Press q to exit this report card" >> reportcard.txt
                                less -R reportcard.txt                                                          # display entire scrollable report card in color codes
                                rm user_answer.txt
                                rm result.txt
                                rm reportcard.txt
                                ;;
                            2)                                                             # case option if user selects to logout from test taking menu
                                echo "You are logged out!!!"
                                check=0
                                cmdtest
                                ;;
                            *)
                                echo "Invalid option selected"                            # default case if invalid option is selected
                                ;;                                
                        esac
                    done
                else
                    echo "Incorrect Password! Please enter the correct password."     # check if password given is incorrect then return back to main menu
                    cmdtest
                fi
            else
                echo "Incorrect Username! Please enter correct username"             # check if username is incorrect then return back to main menu
                cmdtest
            fi
            ;;
        3)                                                  # case option from main menu if user selects to make a final exit from it
            echo "Goodbye! Have a nice day"
            ;;
        *)
            echo "Invalid Choice Selected"
            cmdtest
            ;;
    esac
}

#--------------------------------View Test--------------------------------#

function view_test
{
	echo "This is also working"
}

#--------------------------------Sign Up--------------------------------#

function sign_up
{
	# clear
	# echo "-----Sign Up and Register-----"
	# read -p "Enter Your Name: " name
	# read -p "Enter Your Username: " user
	# read -p "Enter Your Password: " pass
	# read -sp "Confirm Your Password: " cpass
	# if [[ $pass -eq $cpass ]]
	# then
	# 	echo -e "\nYou're successfully signed up. Please Wait..."
	# 	sleep 1
	# 	echo -e "\nWe are redirecting you to Sign in"
	# 	sleep 1
	# 	loading
	# 	sign_in
	# else
	# 	echo -e "\nPassword Mismatch. Try Again After 10 SEC"
	# 	countdown
	# 	sign_up
	# fi
	clear
	echo "------------------------------------------------"
	echo "|                   Sign up                    |"
	echo "------------------------------------------------"
	read -p "Enter the username: " user       # read username
    unames=(`cat user.csv`)                   # store all usernames from user file to array
    unames_len=${#unames[@]}
    flag=1
    for i in `seq 0 $(($unames_len-1))`       # loop to validate if entered username already exists or not
    do
    if [ $user = ${unames[$i]} ]
    then
        flag=0
    fi
    done

    if [ $flag -eq 1 ]                        # if username does not exist request password from user
    then
        read -sp "Enter your password: " pass1
        read -sp "Confirm your password: " pass2
		if [ $pass1 = $pass2 ]               # check for password confirmation
    	then
        	echo $user >> user.csv                                    # save user to user.csv file
        	echo $pass2 | base64 >> password.csv                      # save encoded password in password.csv file
        	echo -e "\nUser registration succesfull!!!"
			sleep 1
			iloading
			authentication
    	else
        	echo -e "\nPassword mismatch! Please enter correct password"   # check for password mismatch & return to start menu
    	fi
    else
        echo "The $user username is already present"                  # check if user is available & return to start menu
        echo "Kindly Sign in to proceed."
		sleep 1
		iloading
		authentication

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
		break
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
