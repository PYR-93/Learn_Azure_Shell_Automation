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
dnf module disable mysql &>>${Logfile}
StatusCheck $?

echo "---------Install My SQL Comunity server-----------"
yum install mysql-community-server -y &>>${Logfile}
StatusCheck $?
 echo "--------------Enable & Start the Service-------------"
systemctl enable mysqld &>>${Logfile}
StatusCheck $?
systemctl start mysqld &>>${Logfile}
StatusCheck $?




