kubectl apply --namespace ratingsapp -f ratings-api-service.yaml

kubectl get deployment ratings-api --namespace ratingsapp

kubectl get service ratings-api --namespace ratingsapp

kubectl get pods --namespace ratingsapp -l app=ratings-api -w

kubectl get endpoints ratings-api --namespace ratingsapp




