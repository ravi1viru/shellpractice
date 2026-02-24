#!/bin/bash

LOG_FOLDER="/var/log/shell-practice"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_NAM="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo -e "ERROR :: Please run the script with root user" &>>$LOG_NAM
   exit 1
else
   echo "Code is running with the root user" &>>$LOG_NAM
fi

VALIDATE(){
    if [ $1 -eq 0 ]; then
      echo "The software $2 installation ... SUCCESS" &>>$LOG_NAM
    else
      echo "The software $2 installation ... FAILURE" &>>$LOG_NAM
      exit 1
    fi
}

# MySQL
dnf list installed mysql-server &>>$LOG_NAM
if [ $? -ne 0 ]; then
    echo "Installing MySQL server..." &>>$LOG_NAM
    dnf install mysql-server -y
    VALIDATE $? "MySQL Server"
else
    echo "MySQL server is already installed" &>>$LOG_NAM
fi

# Python3
dnf list installed python3 &>>$LOG_NAM
if [ $? -ne 0 ]; then
    echo "Installing Python3..." &>>$LOG_NAM
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo "Python3 is already installed" &>>$LOG_NAM
fi

# Nginx
dnf list installed nginx &>>$LOG_NAM
if [ $? -ne 0 ]; then
    echo "Installing Nginx..." &>>$LOG_NAM
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo "Nginx is already installed" &>>$LOG_NAM
fi