Component=frontend
Logfile=/tmp/${Component}
source ./common.sh 


echo "Clean up"
yum remove  -y nginx &>>${Logfile}
StatusCheck $?
rm -rf /etc/nginx &>>${Logfile}
StatusCheck $?

yum install nginx -y
systemctl enable nginx
systemctl start nginx

echo "------------Let's download the HTDOCS content and deploy under the Nginx path----"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>${Logfile}
StatusCheck $?



echo "----------Deploy the downloaded content in Nginx Default Location.------"

cd /usr/share/nginx/html &>>${Logfile}
StatusCheck $?
rm -rf * 
unzip /tmp/frontend.zip &>>${Logfile}
StatusCheck $?
mv frontend-main/static/* . &>>${Logfile}
StatusCheck $?
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>${Logfile}
StatusCheck $?


echo " Updating the systemD service file with DNS name"
sed -i -e '/catalogue/ s/localhost/catalogue.Roboshop.internal/'  /etc/nginx/default.d/roboshop.conf &>>${Logfile}
StatusCheck $?
sed -i -e '/user/ s/localhost/user.roboshop.internal/'  /etc/nginx/default.d/roboshop.conf &>>${Logfile}
StatusCheck $?
sed -i -e '/cart/ s/localhost/cart.roboshop.internal/'  /etc/nginx/default.d/roboshop.conf &>>${Logfile}
StatusCheck $?
sed -i -e '/shipping/ s/localhost/shipping.roboshop.internal/'  /etc/nginx/default.d/roboshop.conf &>>${Logfile}
StatusCheck $?
sed -i -e '/payment/ s/localhost/payment.roboshop.internal/'  /etc/nginx/default.d/roboshop.conf &>>${Logfile}
StatusCheck $?



echo "--------------Finally restart the service once to effect the changes.--------------"
systemctl restart nginx &>>${Logfile}
StatusCheck $?



