source ./Cart.sh 




APP_Prereq() {
    echo "-------Test function from another sh file---------"
    yum -m instal git &>>${Logfile}
}

APP_Prereq

Zcho "tesy " &>>${Logfile}

echo -e status="\e[32m Success \e[0m"
echo -e status="\e[31m Failed \e[0m"