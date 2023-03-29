component=frontend
for component in frontend; do
  vmname=$component
  resourcegroup="Learn_Azure"
  username="centosvm1"
  password="@BeStrong4816"
  image="/subscriptions/54d1ecf0-fc36-4e9e-9f37-3f5e0b35d6a5/resourceGroups/Learn_Azure/providers/Microsoft.Compute/galleries/Gallary_Master/images/VM-Image-Def"
  az vm create \
    --resource-group $resourcegroup \
    --name $vmname \
    --image eurolinuxspzoo1620639373013:centos-8-5-free:centos-8-5-free:8.5.5 \
    --admin-username $username \
    --admin-password $password \
    --size Standard_B1s \
    --public-ip-address  \
    --vnet-name Learn_Azure_Focus-vnet \
    --subnet default \
    --nsg JumpServer-MainVM-nsg
done


resourceGroup="Learn_Azure"
gallery="Master_Gallery"
az sig image-definition list \
   --resource-group $resourceGroup \
   --gallery-name $gallery \
   --query "[].[name, id]" \
   --output tsv

   VM-Image-Def    /subscriptions/54d1ecf0-fc36-4e9e-9f37-3f5e0b35d6a5/resourceGroups/Learn_Azure/providers/Microsoft.Compute/galleries/Gallary_Master/images/VM-Image-Def

  imageDef        /subscriptions/54d1ecf0-fc36-4e9e-9f37-3f5e0b35d6a5/resourceGroups/Learn_Azure/providers/Microsoft.Compute/galleries/Master_Gallery/images/imageDef

for component in frontend1; do
  vmname=$component
  resourcegroup="Learn_Azure"
  username="centosvm1"
  password="@BeStrong4816"
  image="/subscriptions/54d1ecf0-fc36-4e9e-9f37-3f5e0b35d6a5/resourceGroups/Learn_Azure/providers/Microsoft.Compute/galleries/Master_Gallery/images/imageDef/versions/1.0.0"
  az vm create \
    --resource-group $resourcegroup \
    --name $vmname \
    --image $image \
    --admin-username $username \
    --admin-password $password \
    --size Standard_B1s
    
done




imgDef="/subscriptions/54d1ecf0-fc36-4e9e-9f37-3f5e0b35d6a5/resourceGroups/Learn_Azure/providers/Microsoft.Compute/galleries/Master_Gallery/images/imageDef/versions/1.0.0"
for component in frontend user ; do
az vm create --resource-group Learn_Azure --name $component  --image $imgDef --public-ip-address "" --vnet-name Centos-vm-vnet --subnet default  --admin-username centos --admin-password DevOps654321  --storage-sku Standard_LRS  --size Standard_B1ms --nsg "" --plan-name centos-8-5-free --plan-product centos-8-5-free --plan-publisher eurolinuxspzoo1620639373013
az vm auto-shutdown -g Learn_Azure -n  $component --time 1230  
done