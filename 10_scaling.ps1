kubectl apply --namespace ratingsapp -f ratings-api-hpa.yaml

# Follow the steps in https://docs.microsoft.com/en-us/learn/modules/aks-workshop/10-scale-application for hpa test.
# in cloud shell -->

$LOADTEST_API_ENDPOINT= "frontend.<your ingress IP>.nip.io/api/loadtest"

#update this if reqd.

RESOURCE_GROUP=aksworkshop01 # update with your values

az container create \
    -g $RESOURCE_GROUP \
    -n loadtest \
    --cpu 4 \
    --memory 1 \
    --image azch/artillery \
    --restart-policy Never \
    --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"

az container create -g $RESOURCE_GROUP -n loadtest --cpu 4 --memory 1 --image azch/artillery --restart-policy Never --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"
az container create -g $RESOURCE_GROUP -n loadtest1 --cpu 4 --memory 1 --image azch/artillery --restart-policy Never --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"
az container create -g $RESOURCE_GROUP -n loadtest2 --cpu 4 --memory 1 --image azch/artillery --restart-policy Never --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"
az container create -g $RESOURCE_GROUP -n loadtest3 --cpu 4 --memory 1 --image azch/artillery --restart-policy Never --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"
az container create -g $RESOURCE_GROUP -n loadtest4 --cpu 4 --memory 1 --image azch/artillery --restart-policy Never --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"

# Watch the horizontal pod autoscaler working.

kubectl get hpa --namespace ratingsapp -w


# Update the api deployment file with increased resources and apply again

kubectl apply --namespace ratingsapp -f ratings-api-deployment.yaml

# check the pods pending status

kubectl get pods --namespace ratingsapp -l app=ratings-api -w

# enable auto scale by running

az aks update --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME  --enable-cluster-autoscaler --min-count 3 --max-count 5

# check the pods now.

kubectl get nodes -w

