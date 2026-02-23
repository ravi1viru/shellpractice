#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "Error :: istall with root user"
   exit 1
else
   echo "you can install root user"

fi
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install mysql -y

if [ $? -eq 0 ]
then
   echo "mysql is installed status....SUCCESS"
else
   echo "mysql is installed status....FAILURE"
exit 1

fi
else
    echo "MySQL is already installed... Nothing to do"
    exit 1
fi

