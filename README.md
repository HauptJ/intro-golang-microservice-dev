# intro-golang-microservice-dev
Introduction to Golang Microservice Development Presentation

### Component Services:
- a. [HauptJ/Golang-API-DNS](https://github.com/HauptJ/Golang-API-DNS)
- b. [HauptJ/Golang-API-Github](https://github.com/HauptJ/Golang-API-Github)

### Installation - WIP
1. Initialize: ```terraform init```
2. Set DIGITALOCEAN_TOKEN environment variable
2. Plan: ```terraform plan```
3. Apply: ```terraform apply```
4. Add the K8s cluster config to Kube config file
    - Reference either the ```terraform.tfstate``` file or download the cluster config from the DigitalOcean Kubernetes cluster dashboard
4. create the secret for the Github API Token: ```kubectl create secret generic gh-api-token --from-literal=token='YOUR GITHUB API TOKEN'```
5. Install the Nginx Ingress Controller
    - a. ```helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx```
    - b. ```helm repo update```
    - c. ```helm install nginx-ingress ingress-nginx/ingress-nginx --set controller.publishService.enabled=true```
6. Apply the K8s Deployments
    - a. ```kubectl apply -f golang_api_dns_deployment.yaml```
    - b. ```kubectl apply -f golang_api_github_deployment.yaml```
7. Apply the K8s Services
    - a. ```kubectl apply -f golang_api_dns_service.yaml```
    - b. ```kubectl apply -f golang_api_github_servuce.yaml```
9. Configure the ingress.yaml host paramaters to point to your domain or sub domain
10. Configure A DNS records for both services with a TTL of 1800 using the EXTERNAL-IP of the nginx-ingress-ingress-nginx-controller LoadBalancer
- ```kubectl --namespace default get services -o wide  nginx-ingress-ingress-nginx-controller```
11. Apply the K8s Ingress: ```kubectl apply -f ingress.yaml```

References:
- [How To Set Up an Nginx Ingress on DigitalOcean Kubernetes Using Helm](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-on-digitalocean-kubernetes-using-helm)