#$REGION_NAME= "eastus"
#$RESOURCE_GROUP= "aksworkshop10"
#$SUBNET_NAME= "aks-subnet10"
#$VNET_NAME= "aks-vnet10"

# update the name
#$WORKSPACE= "aksworkshop-workspace-Github"

REGION_NAME=eastus
RESOURCE_GROUP=aksworkshop10
SUBNET_NAME=aks-subnet10
VNET_NAME=aks-vnet10

# update the name
WORKSPACE=aksworkshop-workspace-Github

# change with your cluster name 
#$AKS_CLUSTER_NAME= "aksworkshop-Github" 
AKS_CLUSTER_NAME=aksworkshop-Github 


az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME

helm repo add bitnami https://charts.bitnami.com/bitnami

helm search repo bitnami

# change with your user name and password 
helm install ratings bitnami/mongodb --namespace ratingsapp --set auth.username=mongoadmin,auth.password=mongopass,auth.database=ratingsdb

# change with your user name and password 
kubectl create secret generic mongosecret --namespace ratingsapp --from-literal=MONGOCONNECTION="mongodb://mongoadmin:mongopass@ratings-mongodb.ratingsapp:27017/ratingsdb"

kubectl describe secret mongosecret --namespace ratingsapp



