vmname="myVM"
resourvegroup="Learn_Azure_Focus"
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

