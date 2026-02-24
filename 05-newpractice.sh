#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo -e " ERROR :: Please run the script with root user"
   exit 1
else
   echo "code is run with the rootuser"
fi

VALIDATE(){

    if [ $1 -eq 0 ]
    then
      echo "the software $2 is installed ... SUCCESS"
    else
      echo "the software $2 is installed ... FAILURE"
      exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0]
then 
echo "please install the sql server"
     dnf install mysql -y
     VALIDATE $? "MYSQL"
else
echo "already installed the sql server no need"
fi

dnf list installed python3
if [ $? -ne 0]
then 
echo "please install the python server"
     dnf install pthon3 -y
     VALIDATE $? "python3"
else
echo "already installed the python server no need"
fi

dnf list installed nginx
if [ $? -ne 0]
then 
echo "please install the nginx server"
     dnf install nginx -y
     VALIDATE $? "nginx"
else
echo "already installed the nginx server no need"
fi