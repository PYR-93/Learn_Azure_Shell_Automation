
# The below command extract the first 3 charecters of a input or 3 charecters from every line in a file , "-c represents charecter"
# echo "Test the cut command" | cut -c 1-3

# cut -c 1-3 sample.txt

# cut -c 55-66 sample.txt

# grep root@localhost: sample.txt | cut -c 92-103

#The below command extract specific field based on delimiter used inside the file example : The sharp knife
# Delimiter f field
#cut -d ' ' -f 11 sample.txt 
# var1=$(grep root@localhost: sample.txt | cut -d ' ' -f 11)
# echo $var1
# grep root@localhost: sample.txt | cut -d ' ' -f 11 >> temp.txt

grep root@localhost: PassFile.txt | cut -d ' ' -f 11 >> temp.txt
last_entry=$(tail -n 1 temp.txt)
echo $last_entry


