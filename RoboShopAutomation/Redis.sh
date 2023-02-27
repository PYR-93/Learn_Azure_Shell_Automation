Component=redis
Logfile=/tmp/${Component}
source ./common.sh

echo "----Downloading Redis Repo-------------"
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y --skip-broken &>>${Logfile}
StatusCheck $?

echo "----Installing Redis Repo-------------"
dnf module enable redis:remi-6.2 -y &>>${Logfile}
StatusCheck $?
yum install redis -y &>>${Logfile}
StatusCheck $?


echo "----Changing the content /127.0.0.1/0.0.0.0'-------------"
sed -i -e 's/127.0.0.1/0.0.0.0' /etc/redis.conf &>>${Logfile}
StatusCheck $?

echo "stoping the service before cleanup"
systemctl stop ${Component}.service

echo "----Enabling the system-------------"

systemctl enable redis &>>${Logfile}
StatusCheck $?

echo "----Starting the service-------------"
systemctl start redis &>>${Logfile}
StatusCheck $?
