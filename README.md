# GCP_Final_Task

##  Infrastructure is created on GCP using terraform.
### To run terraform infrastructre 
- gcloud auth application-default login
- terraform init
- terraform plan
- terraform apply
### Download the code 
https://github.com/atefhares/DevOps-Challenge-Demo-Code

### Build dockerfile for python app and push image to GCR locally from your machine
```bash
 gcloud config set default service account
 gcloud auth list
 gcloud auth configure-docker
 sudo docker build -t python-app .
 sudo docker tag python-app gcr.io/warm-pixel-375711/python-app 
 sudo docker push gcr.io/warm-pixel-375711/python-app 
```
### Pull redis image from dockerhub and push it to GCR
```bash
 sudo docker pull redis
 sudo docker tag redis gcr.io/warm-pixel-375711/redis
 sudo docker push gcr.io/warm-pixel-375711/redis
 ```
## Connect ssh to vm 
```bash
  sudo apt update
  sudo apt-get install kubectl
  sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
```
### Connect to cluster
```bash
gcloud container clusters get-credentials terraform-private-cluster --zone us-central1-a --project warm-pixel-375711
```

### Connect ssh to gke 
#### ConfigMap is used to store data as key-value pairs instead of writing enviroment variables hard-coded in the docker file.So, if you want to make any changes in values of enviroment variable you should update them in config map.
```bash
kubectl apply -f redis–deployment.yaml
kubectl apply -f redis–sevice.yaml
kubectl apply -f configMap.yaml
kubectl apply -f deployment.yaml
kubectl apply -f load-balancer-service.yaml
kubectl get all

```

![final](https://user-images.githubusercontent.com/63955669/217941923-42ccee64-8b2f-4f42-ab0d-6ca1a1b4425f.png)



