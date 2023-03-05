vmname="myVM"
resourcegroup="Learn_Azure_Focus"
username="Centos-VM-1r"
password="@BeStrong4816"
az vm create \
    --resource-group $resourcegroup \
    --name $vmname \
    --image Win2022AzureEditionCore \
    --public-ip-sku Standard \
    --admin-username $username \
    --admin-password $password \
    --image OpenLogic:CentOS:6.5:latest \
    --size Standard B1s \
    --publisher eurolinuxspzoo1620639373013 \
    --offer centos-8-5-free \
    --sku centos-8-5-free \
    --version latest \

# az vm create --resource-group azure-training-2023 --name $component --image OpenLogic:CentOS-LVM:8-lvm-gen2:8.5.2022101401 --vnet-name azure-training-2023-vnet --subnet default  --admin-username centos --admin-password DevOps654321 --public-ip-address "" --size Standard_B1s --nsg "" 