Component=rabbitmq
Logfile=/tmp/${Component}
source ./common.sh 

echo  "Erlang is a dependency which is needed for RabbitMQ."
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | sudo bash &>>${Logfile}
StatusCheck $?

echo "---------------Install erlang -------------"
yum install erlang -y &>>${Logfile}
StatusCheck $?


echo "Setup YUM repositories for RabbitMQ."


curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash &>>${Logfile}
StatusCheck $?

echo "Stop Rabbitmq service"
systemctl stop rabbitmq-server 

echo "-------------------- Install RabbitMQ-----------"
yum install rabbitmq-server -y &>>${Logfile}
StatusCheck $?


echo "---------------Start RabbitMQ---------------------"
systemctl enable rabbitmq-server &>>${Logfile}
StatusCheck $?
systemctl start rabbitmq-server &>>${Logfile}
StatusCheck $?

rabbitmqctl list_users | grep -i roboshop &>>${Logfile}
if [ $? -ne 0 ]; then
echo "Adding the user"
rabbitmqctl add_user roboshop roboshop123 
StatusCheck $?
fi


echo " set roboshop user in rabbitmq as administrator"

rabbitmqctl set_user_tags roboshop administrator &>>${Logfile}
StatusCheck $?
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>${Logfile}
StatusCheck $?