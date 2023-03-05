for component in user cart catalogue payment shipping frontend mongodb redis mysql rabbitmq dispatch; do
  vmname=$component
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
    --vnet-name Learn_Azure_Focus-vnet \
    --subnet default \
    --nsg ""
done