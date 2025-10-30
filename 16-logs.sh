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

dnf list installed mysql &>>$LOG_FILE
#install if it is not found
if [ $? -ne 0 ]; then
    dnf  install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL already exists..... $Y SKIPPING $NO " | tee -a $LOG_FILE
fi
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "NGINX"
else
    echo -e "NGINX already exists.....$Y SKIPPING $NO" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? " python3"
else
    echo -e "Phython already exists.....$Y SKIPPING $NO" | tee -a $LOG_FILE
fi