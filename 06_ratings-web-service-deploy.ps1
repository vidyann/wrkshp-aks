kubectl apply --namespace ratingsapp -f ratings-web-service.yaml

kubectl get deployment ratings-web --namespace ratingsapp

kubectl get pods --namespace ratingsapp -l app=ratings-web -w

kubectl get service ratings-web --namespace ratingsapp

kubectl get endpoints ratings-web --namespace ratingsapp




