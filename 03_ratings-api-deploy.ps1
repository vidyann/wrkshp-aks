kubectl apply --namespace ratingsapp -f ratings-api-deployment.yaml
kubectl set image deployment/ratings-api ratings-api=acr10.azurecr.io/ratings-api:v1 --namespace ratingsapp



kubectl get pods --namespace ratingsapp -l app=ratings-api -w

kubectl get deployment ratings-api --namespace ratingsapp

