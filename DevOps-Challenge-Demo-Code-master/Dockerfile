FROM python:3.9

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "hello.py" ]
#ENTRYPOINT  export $(cat .env | xargs) && python hello.py

# add service account in iam with storage admin role
# gcloud config set account my-first-serviceaccount@warm-pixel-375711.iam.gserviceaccount.com
# gcloud auth list
# gcloud auth configure-docker
# docker build -t python-app .
# docker tag python-app gcr.io/warm-pixel-375711/python-app 
# docker push gcr.io/warm-pixel-375711/python-app  


# redis 
# docker pull redis
# docker tag redis gcr.io/warm-pixel-375711/redis
# docker push gcr.io/warm-pixel-375711/redis


# connect ssh to vm 
# connect to sql gcloud container clusters get-credentials terraform-private-cluster --zone us-central1-a --project warm-pixel-375711
# sudo apt-get install kubectl
# sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin


# copy deployment files from local to vm 
# gcloud compute scp /home/marwa/Desktop/GCP_Finak_Task/Deployment terraform-private-vm:/home/marwaahmed200126


# docker build -t python-app3 .
# docker run <imagename> 
# docker inspect 

# sudo apt install docker.io