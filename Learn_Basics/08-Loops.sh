# For loops

for color in blue black white brown; do
    echo "------The color is $color-------"
    #sleep 2
done
x=" "
for Color in pink green white black; do
    echo "The color is $Color"
    x=$Color$x
done
echo $x

# While Loop
x=10
while [ $x == 10 ]; do
    echo "X is equal"
    if [ $x = 10 ]
        then 

        echo " value is 10 doing increment"
        x=$(($x+1))
    else
        echo exist
    fi
done
