source ./Cart.sh 

APP_Prereq() {
    echo "-------Test function from another sh file---------"
    yum -m instal git 2>>${Logfile}
}

APP_Prereq

Zcho "tesy " &>>${Logfile}