Component=mongodb
Logfile=/tmp/${Component}
source ./common.sh 

echo "************Fetchin the Repo*******"
curl -s -o /etc/yum.repos.d/{Component}.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>${Logfile}
StatusCheck $?

echo "*******Install mongodg********"
yum install -y mongodb-org
echo "*******Enable mongodg********"
systemctl enable mongod
echo "*******Start mongodg********"
systemctl start mongod

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo "restart the service"
systemctl restart mongod



echo " cleanup before installation"
rm -rf /tmp/mongodb.zip
rm -rf /tmp/mongodb-main &>>${Logfile}
StatusCheck $?

echo "Download the Zip file MongoDB"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

cd /tmp
unzip mongodb.zip
cd mongodb-main
mongo < catalogue.js
mongo < users.js



