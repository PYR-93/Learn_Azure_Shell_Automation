echo $0 #-----$0 will fetch the script name that we are executing#

echo $1 # -- Argument 1

echo $2 # -- Argument 2

echo $4 # --- Argument 4

echo $* # All arguments
echo $@ # All Arguments

echo $# # How many variable has been passed

# The above arguments can be used as inputs from user 
# Example 
##$ sh 04-SystemVariable.sh yogi teju mahi nani
#04-SystemVariable.sh
#yogi
#teju
#nani