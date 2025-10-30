#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 10 ]; then 
    echo "ERROR:: Please run this script with root privilage"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing MYSQL is failure"
else
    echo "Installing MYSQL is SUCCESS"
fi