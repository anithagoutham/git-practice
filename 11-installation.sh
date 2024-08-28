#!/bin/bash

userid=$(id -u)

echo " userid = $userid "

if [ $userid -ne 0 ]
then 
  echo " run this script with priveleges "
  exit 1

fi

dnf install git -y