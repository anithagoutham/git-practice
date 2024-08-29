#!/bin/bash

userid=($id -u)

check_root(){
    if($userid -ne 0)
    then 
        echo " plz run this script with root privilages "
        exit 1
    fi
}

validate(){
    if($1 -ne 0)
    then 
        echo " $2 is success "
        exit 1
    else
        echo " $2 is failed "
    fi
}

check_root

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y
    validate $? "Installing Git"
else
    echo "Git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed...going to install"
    dnf install mysql -y
    validate $? "Installing MySQL"
else
    echo "MySQL is already installed..nothing to do"
fi