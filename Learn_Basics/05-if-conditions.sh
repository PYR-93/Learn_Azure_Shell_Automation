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

file=/root/Learn_Azure_Shell_Automation/Learn_Basics/05*

if [ -f $file ]
then 
    echo file exist
else 
    echo file doesnot exist
fi


# Write a programm to find if which 




