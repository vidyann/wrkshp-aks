$REGION_NAME= "eastus"
$RESOURCE_GROUP= "aksworkshop01"
$SUBNET_NAME= "aks-subnet"
$VNET_NAME= "aks-vnet"

# update the name
$WORKSPACE= ""

# change with your cluster name 
$AKS_CLUSTER_NAME= "" 

az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME

helm repo add bitnami https://charts.bitnami.com/bitnami

helm search repo bitnami

# change with your user name and password 
helm install ratings bitnami/mongodb --namespace ratingsapp --set auth.username=<user name>,auth.password=<your password>,auth.database=ratingsdb

# change with your user name and password 
kubectl create secret generic mongosecret --namespace ratingsapp --from-literal=MONGOCONNECTION="mongodb://<user name>:<your password>@ratings-mongodb.ratingsapp:27017/ratingsdb"

kubectl describe secret mongosecret --namespace ratingsapp



