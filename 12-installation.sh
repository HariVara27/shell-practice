#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 10 ]; then 
    echo "ERROR:: Please run this script with root privilage"
    exit 1 #failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing MYSQL is failure"
    exit 1
else
    echo "Installing MYSQL is SUCCESS"
fi