#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
NO="\e[0m" #no color 

if [ $USERID -ne 0 ]; then 
    echo "ERROR:: Please run this script with root privilage"
    exit 1 #failure is other than 0
fi

VALIDATE(){ #functions recieve i/p's through args like shell script args

    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installing $2 is......$R failure $NO"
        exit 1
    else
        echo -e  "Installing $2 is..........$G  SUCCESS $NO"
    fi

}

dnf list installed mysql
#install if it is not found
if [ $? -ne 0 ]; then
    dnf  install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "MYSQL already exists.....$Y SKIPPING $NO"
fi
dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo "NGINX already exists.....$Y SKIPPING $NO"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? " python3"
else
    echo "Phython already exists.....$Y SKIPPING $NO"
fi