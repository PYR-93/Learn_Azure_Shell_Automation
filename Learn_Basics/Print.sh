#!/bin/bash

Yellow="33m"
RED="31m"
ENDTHECLR="\e[0m"
echo $Yellow
echo $ENDTHECLR

echo -e "\e[1;${Yellow} Hello World ${ENDTHECLR}"

echo " rest color"