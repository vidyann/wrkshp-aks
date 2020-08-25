# update the values below
$REGION_NAME= ""
$RESOURCE_GROUP= ""
$SUBNET_NAME= ""
$VNET_NAME= ""
$WORKSPACE= "" 
$AKS_CLUSTER_NAME= "" # change with your cluster name

$WORKSPACE_ID= $(az resource show --resource-type Microsoft.OperationalInsights/workspaces --resource-group $RESOURCE_GROUP --name $WORKSPACE --query "id" -o tsv)

az aks enable-addons --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME --addons monitoring --workspace-resource-id $WORKSPACE_ID

kubectl apply -f logreader-rbac.yaml

