#!/bin/bash

userid=$(id -u)

echo " userid = $userid "

if [ $userid -ne 0 ]
then 
  echo " run this script with priveleges "
  exit 1

fi

dnf list install git -y

if [ $? -ne 0 ]
then 
  echo " git is not installed, then install it "
   dnf install git -y

else
  echo " git is already installed "

fi   
