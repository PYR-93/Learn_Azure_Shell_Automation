COMPONENT=prep 
LOG_FILE=/tmp/${COMPONENT}
source ./common.sh 
echo "disable selinux"
sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config &>>${Logfile}
StatusCheck $?

echo "install git on it"
yum install -y git  &>>${Logfile}

StatusCheck $?

git clone https://github.com/PYR-93/Learn_Azure_Shell_Automation.git

sleep 10

reboot 