kubectl apply --namespace ratingsapp -f ratings-web-deployment.yaml
kubectl set image deployment/ratings-web ratings-web=acr10.azurecr.io/ratings-web:v1 --namespace ratingsapp

kubectl get pods --namespace ratingsapp -l app=ratings-web -w

kubectl get deployment ratings-web --namespace ratingsapp

