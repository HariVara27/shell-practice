#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "ERROR:: Please run this script with root privilage"
    exit 1 #failure is other than 0
fi

VALIDATE(){ #functions recieve i/p's through args like shell script args

    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is SUCCESS"
    fi

}

dnf install mysql -y

    VALIDATE $? "MYSQL"

dnf install nginix -y

    VALIDATE $? "NGINIX"

dnf install mongodb-mongosh -y

    VALIDATE $? "MONGOSH"