#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "Error :: istall with root user"
   exit 1
else
   echo "you can install root user"
fi



