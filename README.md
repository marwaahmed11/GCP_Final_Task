# GCP_Final_Task

##  Infrastructure is created on GCP using terraform.
### To run terraform infrastructre 
- gcloud auth application-default login
- terraform init
- terraform plan
- terraform apply

## Connect ssh to vm 
```bash
  sudo apt update
  sudo apt install docker.io
  sudo apt-get install kubectl
  sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
```
### Connect to sql 
```bash
gcloud container clusters get-credentials terraform-private-cluster --zone us-central1-a --project warm-pixel-375711
```
### Download the code 
https://github.com/atefhares/DevOps-Challenge-Demo-Code

### Build dockerfile and push image to GCR 
```bash
 gcloud config set accountmy-gke-sa@warm-pixel-375711.iam.gserviceaccount.com
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

### Connect ssh to gke 
#### ConfigMap is used to store data as key-value pairs instead of writing enviroment variables hard-coded in the docker file.So, if you want to make any changes in values of enviroment variable you should update them in config map.
```bash
kubectl apply -f redis–sevice.yaml
kubectl apply -f redis–deployment.yaml
kubectl apply -f configMap.yaml
kubectl apply -f deployment.yaml
kubectl apply -f load-balancer-service.yaml
kubectl get all

```

![vm2](https://user-images.githubusercontent.com/63955669/217813564-abe24064-299a-452f-96bd-9f877b222015.png)



