kubectl apply --namespace ratingsapp -f ratings-api-deployment.yaml

kubectl get pods --namespace ratingsapp -l app=ratings-api -w

kubectl get deployment ratings-api --namespace ratingsapp

