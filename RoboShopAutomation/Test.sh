source ./Cart.sh 

APP_Prereq() {
    echo "-------Test function from another sh file---------"
    yum -m instal git & >>${Logfile}
}

APP_Prereq

Zcho "tesy " &>>${Logfile}