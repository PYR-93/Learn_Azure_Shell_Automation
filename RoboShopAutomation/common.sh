ID=$(id -u)
if [ $ID -ne 0 ]; then
    echo "----You are not running as root User this will fail"
    exit 1
fi

StatusCheck() {
    if [ $1 -eq 0 ]; then
       echo -e status="\e[32m Success \e[0m"
    else
        echo -e status="\e[31m Failed \e[0m"
        exit 1
    fi

}

APP_PREREQ() {

echo "-------Checking for user if already exists..?--------------"
id roboshop &>>${Logfile}
if [ $? -ne 0 ]; then
    echo "-------User adding----------"
    useradd roboshop &>>${Logfile}
    StatusCheck $?
fi

echo "-----Download ${Component}---------------"
curl -s -L -o /tmp/${Component}.zip "https://github.com/roboshop-devops-project/${Component}/archive/main.zip" &>>${Logfile}
StatusCheck $?

echo "stoping the service before cleanup"
    systemctl stop ${Component}.service

echo "------Remove the old content if any-------"
cd /home/roboshop && rm -rf ${Component} &>>${Logfile}
StatusCheck $?


echo "---Unzip the files------${Component}"
unzip -o /tmp/${Component}.zip &>>${Logfile}
StatusCheck $?

echo "----Moving the files------"
rm -rf 
mv ${Component}-main ${Component} &>>${Logfile}
StatusCheck $?



}

SYSTEMD() {

echo "----Changing the respective EndPoints with IP address---------"
sed -i -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e 's/MONGO_ENDPOINT/mongodb.roboshop.internal/' -e 's/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/' -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' -e 's/CARTENDPOINT/cart.roboshop.internal/' -e 's/DBHOST/mysql.roboshop.internal/' -e 's/CARTHOST/cart.roboshop.internal/' -e 's/USERHOST/user.roboshop.internal/' -e  's/AMQPHOST/rabbitmq.roboshop.internal/' /home/roboshop/${Component}/systemd.service &>>${Logfile}
StatusCheck $?


echo "---------Moving the service file----------"
mv /home/roboshop/${Component}/systemd.service /etc/systemd/system/${Component}.service &>>${Logfile}
StatusCheck $?
echo "----Reloading the configuration-------"
systemctl daemon-reload &>>${Logfile}
StatusCheck $?

echo "----Starting the service--------"
systemctl start ${Component} &>>${Logfile}
StatusCheck $?


echo "---Enabling the service------"
systemctl enable ${Component} &>>${Logfile}
StatusCheck $?



}

NODEJS() {
    
echo "-----Setting up Node JS--------"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${Logfile}
StatusCheck $?

echo "---Installing node js"
yum install nodejs -y &>>${Logfile}
StatusCheck $?


APP_PREREQ


echo "-----Installing NODEJS dependencies---------"
cd /home/roboshop
cd ${Component}
npm install &>>${Logfile}
StatusCheck $?

SYSTEMD
}

MAVEN() {

    echo "---Installing Maveen for Shipping------"
    yum install maven -y &>>${Logfile}
    StatusCheck $?

    APP_PREREQ

    cd ${Component}
    mvn clean package &>>${Logfile}
    StatusCheck $?
    mv target/shipping-1.0.jar shipping.jar &>>${Logfile}
    StatusCheck $?

    SYSTEMD

}