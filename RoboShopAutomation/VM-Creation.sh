vmname="myVM"
resourcegroup="Learn_Azure_Focus"
username="centosvm1"
password="@BeStrong4816"
az vm create \
    --resource-group $resourcegroup \
    --name $vmname \
    --image eurolinuxspzoo1620639373013:centos-8-5-free:centos-8-5-free:8.5.5 \
    --admin-username $username \
    --admin-password $password \
    --size Standard_B1s \
    --public-ip-address "" \
    
   

# az vm create --resource-group azure-training-2023 --name $component --image OpenLogic:CentOS-LVM:8-lvm-gen2:8.5.2022101401 --vnet-name azure-training-2023-vnet --subnet default  --admin-username centos --admin-password DevOps654321 --public-ip-address "" --size Standard_B1s --nsg "" 