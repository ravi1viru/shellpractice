#!/bin/bash



LOG_FOLDER="var/log/shell-practice"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_NAM="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo -e " ERROR :: Please run the script with root user" &>>$LOG_NAM
   exit 1
else
   echo "code is run with the rootuser" &>>$LOG_NAM
fi

VALIDATE(){

    if [ $1 -eq 0 ]
    then
      echo "the software $2 is installed ... SUCCESS" &>>$LOG_NAM
    else
      echo "the software $2 is installed ... FAILURE" &>>$LOG_NAM
      exit 1
    fi
}

dnf list installed mysql &>>$LOG_NAM
if [ $? -ne 0 ]
then 
echo "please install the sql server" &>>$LOG_NAM
     dnf install mysql -y
     VALIDATE $? "MYSQL"
else
echo "already installed the sql server no need" &>>$LOG_NAM
fi

dnf list installed python3 &>>$LOG_NAM
if [ $? -ne 0 ]
then 
echo "please install the python server" &>>$LOG_NAM
     dnf install pthon3 -y
     VALIDATE $? "python3"
else
echo "already installed the python server no need" &>>$LOG_NAM
fi

dnf list installed nginx &>>$LOG_NAM
if [ $? -ne 0 ]
then 
echo "please install the nginx server" &>>$LOG_NAM
     dnf install nginx -y
     VALIDATE $? "nginx"
else
echo "already installed the nginx server no need" &>>$LOG_NAM
fi