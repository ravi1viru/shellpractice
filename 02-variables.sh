#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "Error :: istall with root user"
   
else
   echo "you can install root user"

fi

dnf install mysqlgfgg -y

if [ $? -eq 0 ]
then
   echo "mysql is installed status....SUCCESS"
else
   echo "mysql is installed status....FAILURE"
   exit 1

fi
