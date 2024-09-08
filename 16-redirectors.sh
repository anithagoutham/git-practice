#!/bin/bash

logs_folder="/var/log/shell-script"
script_name=echo $(0 | cut -d "." -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S)
log_file="$logs_folder/$script_name-$time-stamp.log"
mkdir -p $logs_folder


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root priveleges $N" &>>$log_file
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N" &>>$log_file
        exit 1
    elseV
        echo -e "$2 is... $G SUCCESS $N" &>>$log_file
    fi
}

usage(){
    echo -e "usage : sudo sh 16-redirectors.sh pack1 pack2 ..."
    exit 1
}

echo "script started executed at = $(date)"

CHECK_ROOT

if [ $# -eq 0 ]
then
   usage
fi

# sh 15-loops.sh git mysql postfix nginx
for package in $@ # $@ refers to all arguments passed to it
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." &>>$log_file
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already installed..nothing to do" &>>$log_file
    fi
done