#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
NO="\e[0m" #no color

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at:: $(date)" | tee -a $LOG_FILE # to apend in log

if [ $USERID -ne 0 ]; then 
    echo "ERROR:: Please run this script with root privilage"
    exit 1 #failure is other than 0
fi

VALIDATE(){ #functions recieve i/p's through args like shell script args

    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installing $2 is...... $R failure $NO" | tee -a $LOG_FILE
        exit 1
    else
        echo -e  "Installing $2 is.......... $G  SUCCESS $NO" | tee -a $LOG_FILE
    fi

}

# $@ -> to get all the variables passed in the arguments in the script.

for package in $@
do 
    #check package is already installed or not
    dnf list installed $package &>>$LOG_FILE
    
    #if exit status is 0, already installed. -ne 0 need to install it
    if [ $? -ne 0 ]; then

        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package already installed... $Y SKIPPING $N"
    fi
done