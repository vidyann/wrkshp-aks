kubectl apply --namespace ratingsapp -f ratings-web-deployment.yaml

kubectl get pods --namespace ratingsapp -l app=ratings-web -w

kubectl get deployment ratings-web --namespace ratingsapp

