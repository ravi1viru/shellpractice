#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo -e "/e[31m ERROR :: Please run the script with root user"
else
   echo "code is run with the rootuser"
fi
