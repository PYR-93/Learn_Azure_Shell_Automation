Component=mysql
Logfile=/tmp/${Component}
source ./common.sh

if [ $# -eq 0 ];then
    echo "Pass the password to script"
    exit 1
fi


echo "-----------------Set up MYSql on Centos 8------------------"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo &>>${Logfile}
StatusCheck $?

echo "-----------------Disabling the service----------"
dnf module disable mysql -y &>>${Logfile}
StatusCheck $?

echo "---------Install My SQL Comunity server-----------"
yum install mysql-community-server -y &>>${Logfile}
StatusCheck $?
 echo "--------------Enable & Start the Service-------------"
systemctl enable mysqld &>>${Logfile}
StatusCheck $?
systemctl start mysqld &>>${Logfile}
StatusCheck $?
echo "*****************************fetching the password from the log file -------------------"
grep root@localhost: /var/log/mysqld.log | cut -d ' ' -f 11 >> tempPass.txt &>>${Logfile}
StatusCheck $?
last_entry=$(tail -n 1 tempPass.txt)
# echo $last_entry

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$1';
FLUSH PRIVILEGES; " > /tmp/pass.txt
StatusCheck $?
echo "*******Entering the validation for the default*********"
echo "show databases;" | mysql --connect-expired-password -uroot -p${last_entry} &>>${Logfile}
if [ $? -eq 0 ]; then
    echo "----Changing the password--------"
    mysql --connect-expired-password -uroot -p${last_entry} < /tmp/pass.txt &>>${Logfile}
    StatusCheck $?
    echo " uninstall plugin validate_password; " | mysql -uroot -p$1 &>>${Logfile}
    StatusCheck $?
fi


echo " cleanup before installation"
rm -rf /tmp/mysql.zip
rm -rf /tmp/mysql-main &>>${Logfile}
StatusCheck $?
echo "Download the Zip file MYSql"
curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"


cd /tmp
unzip mysql.zip
cd mysql-main
mysql -u root -pRoboShop@1 <shipping.sql &>>${Logfile}
StatusCheck $?


