cluster - one node.

deployment - 3 custom nginx pods (ASG), 2 tomcat pods (ASG) + 2 LB services 

### Get started:

In my case, I used a ready-made nginx container from **menfhed** user,
which displays Hostname instead of the default of the nginx page. Plus I did prepare a custom
tomcat container with displays almost the same as nginx.
1. Export your AWS_PROFILE
2. Pull necessary image locally:
```shell
docker pull menfhed/nginx:v3
docker pull maxtimoshchenko/tomcat:2022.4.01
docker images
```
2. Create an AWS ECR repositories (I did it manually). In my case they are called "lesson-1-nginx" nd "lesson-1-tomcat"".
   Do not close a page after repository creation, the URL uses for the next steps.
3. Create tags of necessary image for AWS ECR and push it to ECR:
```shell
# find inage_id
docker images
# REPOSITORY              TAG         IMAGE ID       CREATED          SIZE
# menfhed/nginx           v3          fa5aca40cc63   2 days ago       108MB
# maxtimoshchenko/tomcat  2022.4.01   b27f47994fe5   6 minutes ago    694MB

# ECR login. repeat for both repo
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin {ECR_URL}

# set tags. tag=0.1
docker tag {IMAGE_ID} {ECR_URL}:0.1

# push to ECR
docker push {ECR_URL}:0.1
```
4. Create AWS EKS Cluster from simple-cluster file and wait until CloudFormation will done.
```shell
eksctl create cluster -f simple-cluster.yaml
```
5. Update kubectl config to start work with a new created cluster
```shell
kubectl config set-cluster {CLUSTER_NAME}

# validate it
kubectl get nodes -o wide
```
6. I like to separate my tasks, so I did create a namespace
```shell
kubectl create namespace lesson-1
```
7. Create deployment and service from file:
```shell
kubectl apply -f nginx-nginx-deployment.yaml 
kubectl apply -f tomcat-nginx-deployment.yaml 

# validate it
kubectl get pods -n lesson-1
kubectl get services -n lesson-1
```
8. Copy URL from `get services` command and check it on browser. For tomcat URL you
   need to add `/hello` or `/hello/sayhello` or `/hello/sayhi`

### Delete cluster after tests
```shell
eksctl delete cluster -f simple-cluster.yaml
```