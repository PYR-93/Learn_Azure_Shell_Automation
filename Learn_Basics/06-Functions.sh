a=10
b=20
function Add(){

  add=$(($a+$b))
  echo $add
}
Add

function Test(){
   Str=$(($1+$2))
   echo $Str
}
a=200
b=300
Test $a $b


function Swap(){
C=$a
a=$b
b=$C
echo "a value - $a and B values  - $b"
unset C
echo "The value of c ---- $C"
}

a=2
b=3
Swap $a $b


function Swap2(){
  echo "----------------------Sqap 2--------------------------------"
    var1=$(($a+$b))
   
    a=$(($var1-$a))
    b=$(($var1-$b))
    echo $a $b
}

a=200
b=300
Swap2 $a $b



StatusCheck() {
    if [ $1 -eq 0 ]; then
       echo -e status="\e[32m Success \e[0m"
    else
        echo -e status="\e[31m Failed \e[0m"
        exit 1
    fi

}
Yum insta git &>> cat
StatusCheck $?