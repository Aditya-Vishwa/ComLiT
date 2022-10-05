# Command-Line-Test
## Introduction

Command line test is a BASH shell based tool that simulates login based online testing scenario. Initially the user will be provided with a sign-in option where pre-defined users will be allowed to log in. Upon successful login this tool will display questions for the user from existing data-base. It will also handle error conditions like time-out. This tool will also store answers provided by users for future verification.

These days there are a lot of online test platform which enables students to take tests online. They will typically have a user-interface, backend question bank and evaluation part. They will also support other features like predefined time per question, output reports etc. The idea of this project is to simulate such an online test interface using Linux Shell Scripting and commands. 

By  implementing this Linux Shell Scripting Projects for Beginners Project will make you apply Shell programming constructs (ex: loops), Pattern matching commands (ex: grep, sed etc…) and File handling (ex: permission, directories etc…) aspects during implementation.

## Requirement Details

Following are the requirements for this Linux Shell Scripting Project. Divided into various sections. 

- **Provide a prompt for the user to sign-up and sign-in**
  - Sign In
    1. Take Test
    2. View Test
  - Sign Up
  - Exit
- **Using sign-up user can register with a user-id and password**
  - Ask for user-name. The user-name should contain only alphanumeric symbols
  - Ask for new password. The password can contain any symbol in it. Accept at-least 8 characters
  - with at-least a number and symbol
  - Ask the user to re-enter the password again for validation
- **Already registered user can sign-in with ID and password**
  - The script should prompt for user-name and password
  - The password should be like a shadow password
  - Show error in-case passwords mismatches
- **Create log file**
  - Every activity while the script is to be logged in test_activity.log file.
  - Keep date and time along with every activity.
- **Question bank**
  - User should provide a question bank file along with the script
  - If not search for a file named question_bank.txt as a default question bank.
- **Taking a test**
  - Should create a directory called “.TestData” in user’s directory structure. For example, like –  ECEP/LinuxSystems/Projects directory if it doesn’t exist.
  - Create a file named “answer_file.csv” under TestData directory if it doesn’t exist.
  - Prompt the user with questions one by one randomly picked from the question_bank.
  - Prompt for questions with multiple choice
  - Every question should be timed, say 10 seconds
  - On timeout the question should change with fresh time
  - Every answer should be stored in answer_file.txt with the question separated by comma
  - The answer should be stored with attempt time (say if I answer within 5 seconds, then my answer with 5 seconds (attempt time) should be stored
  - If the user chooses this option, the script should show all the questions with all options, the answer should be highlighted
  - All the user entered answer have to be entered in the answer_file.csv
- **Time-out**
  - The script should time out if the user input is absent for more than 10 seconds on the main menu
  
## Installation
 
- **Clone this repository:**
`````
git clone https://github.com/Aditya-Vishwa/Command-Line-Test.git
`````
- **Go inside the directory:**
`````
cd Command-Line-Test
`````
- **Change Mode of the file:**
`````
sudo chmod +x CLT.sh
`````
- **Run the script by using:**
`````
bash CLT.sh
`````
OR
`````
./CLT.sh
`````
- **And Done.**

## You Can Try this Here:
© OnWorks
Go to this cloud platform and do your work.
`````
https://www.onworks.net/runos/create-os.html
`````
