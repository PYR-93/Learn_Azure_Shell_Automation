declare -i a
a=10

if [ $a -gt 10 ]
then 
    echo $a is greater than 10
elif [ $a -lt 10 ]   
    then
    echo $a is less than 10
else
    echo $a is equal to 10
fi

str="xyz"

if [ $str == "xyz" ]
then 
    echo both strings are same
else
    echo not same
fi

file="/c/Users/pyogeshwar.reddy/OneDrive-IQVIA/Desktop/Learn/Learn_Azure_Shell_Automation/Learn_Basics/ColorCoding.sh"

if [ -f $file ]
then 
    echo file exist
else 
    echo file doesnot exist
fi
