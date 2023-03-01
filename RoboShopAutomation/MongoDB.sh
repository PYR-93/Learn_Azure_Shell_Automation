Component=mongodb
Logfile=/tmp/${Component}
source ./common.sh 

echo "************Fetchin the Repo*******"
curl -s -o /etc/yum.repos.d/{Component}.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>${Logfile}
StatusCheck $?

echo "*******Install mongodg********"
yum install -y mongodb-org &>>${Logfile}
StatusCheck $?
echo "*******Enable mongodg********"
systemctl enable mongod &>>${Logfile}
StatusCheck $?
echo "*******Start mongodg********"
systemctl start mongod &>>${Logfile}
StatusCheck $?

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>${Logfile}
StatusCheck $?
echo "restart the service"
systemctl restart mongod &>>${Logfile}
StatusCheck $?



echo " cleanup before installation"
rm -rf /tmp/mongodb.zip
rm -rf /tmp/mongodb-main &>>${Logfile}
StatusCheck $?

echo "Download the Zip file MongoDB"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>${Logfile}
StatusCheck $?

cd /tmp
unzip mongodb.zip &>>${Logfile}
StatusCheck $?

cd mongodb-main &>>${Logfile}
StatusCheck $?
mongo < catalogue.js &>>${Logfile}
StatusCheck $?
mongo < users.js &>>${Logfile}
StatusCheck $?



