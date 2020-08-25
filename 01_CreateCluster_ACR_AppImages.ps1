REGION_NAME=eastus
RESOURCE_GROUP=aksworkshop01
SUBNET_NAME=aks-subnet
VNET_NAME=aks-vnet
WORKSPACE=aksworkshop-workspace-$RANDOM

az group create --name $RESOURCE_GROUP --location $REGION_NAME

az network vnet create \
 	--resource-group $RESOURCE_GROUP \
 	--location $REGION_NAME \
 	--name $VNET_NAME \
 	--address-prefixes 10.0.0.0/8 \
 	--subnet-name $SUBNET_NAME \
 	--subnet-prefix 10.240.0.0/16

SUBNET_ID=$(az network vnet subnet show \
 	--resource-group $RESOURCE_GROUP \
 	--vnet-name $VNET_NAME \
 	--name $SUBNET_NAME \
 	--query id -o tsv)

VERSION=$(az aks get-versions \
 	--location $REGION_NAME \
 	--query 'orchestrators[?!isPreview] | [-1].orchestratorVersion' \
 	--output tsv)

AKS_CLUSTER_NAME=aksworkshop-$RANDOM
 echo $AKS_CLUSTER_NAME

az aks create \
 --resource-group $RESOURCE_GROUP \
 --name $AKS_CLUSTER_NAME \
 --vm-set-type VirtualMachineScaleSets \
 --load-balancer-sku standard \
 --location $REGION_NAME \
 --kubernetes-version $VERSION \
 --network-plugin azure \
 --vnet-subnet-id $SUBNET_ID \
 --service-cidr 10.2.0.0/24 \
 --dns-service-ip 10.2.0.10 \
 --docker-bridge-address 172.17.0.1/16 \
 --generate-ssh-keys

az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME

kubectl get nodes
kubectl get svc
kubectl get namespace
kubectl create namespace ratingsapp


ACR_NAME=acr$RANDOM
 az acr create \
 	--resource-group $RESOURCE_GROUP \
 	--location $REGION_NAME \
 	--name $ACR_NAME \
 	--sku Standard

git clone https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-api.git
cd mslearn-aks-workshop-ratings-api

az acr build \
 	--resource-group $RESOURCE_GROUP \
 	--registry $ACR_NAME \
 	--image ratings-api:v1 .

cd ~
 git clone https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-web.git
 cd mslearn-aks-workshop-ratings-web
 az acr build \
 	--resource-group $RESOURCE_GROUP \
 	--registry $ACR_NAME \
 	--image ratings-web:v1 .

az acr repository list \
 	--name $ACR_NAME \
 	--output table

az aks update \
 	--name $AKS_CLUSTER_NAME \
 	--resource-group $RESOURCE_GROUP \
 	--attach-acr $ACR_NAME

cd ~

az resource create --resource-type Microsoft.OperationalInsights/workspaces --name $WORKSPACE --resource-group $RESOURCE_GROUP --location $REGION_NAME --properties '{}' -o table



