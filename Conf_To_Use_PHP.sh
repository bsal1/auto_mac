#!/bin/bash

# To check root permissions
if [ "$EUID" -ne 0 ];then
    echo -e "\n This script must be run as root. \n" 
    exit 1   

else 
    echo -e "\n Updating System : \n "
    apt update && apt upgrade -y
    echo -e "\n Installing apache2 : \n "
    apt install apache2
    echo -e "\n MYSQL server : \n " 
    #Adding external source with trust
    apt install debian-archive-keyring
    echo "deb [trusted=yes] http://repo.mysql.com/apt/debian buster mysql-8.0">/etc/apt/sources.list
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
    apt update
    apt install mysql-common -y
    echo -e "\n Installing php : \n"
    apt install php
    echo -e "\n Enabling PHP module for Apache \n :"
    sudo a2enmod php
    echo -e "\n Installing phpmyadmin : \n "
    apt install phpmyadmin
    echo -e "\n Task Completed Succesfully. Do you want to learn further working mechanism (y)? : \n "
    read ans
    if [ "$ans" = "y" ]; then
        echo -e "\n\n\n To start/stop apache2 : sudo service apache2 start/stop"
        echo -e "\n To start/stop mysql   : sudo service mysql start/stop"
        echo -e "\n To replace default web server root directory : "
        echo -e "\n   cd /var/www/html"
        echo -e "\n   sudo nano index.php"
        echo -e '\n   <?php echo"Hello !" ?>'
        echo -e "\n ctrl+s \n ctrl+x \n "
        echo -e "\n Open - http://localhost/phpmyadmin/"
        echo -e "\n Username : root \n Password : < As during installation of phpmyadmin > \n "
        echo -e "\n Happy Learning !!\n Bye_ \n "

    else
        echo -e "\n Happy Learning !!\n Bye_ \n "
        

    fi

 fi
