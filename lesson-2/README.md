helm

### How to create k8s resources with Helm: 
1. Follow Lesson-1 Readme to create necessary Docker images and cluster
2. To create nginx resources run command from lesson-2 directory
```shell
helm install mt-nginx charts/simple-chart/ -f charts/nginx.yaml -n lesson-2
```
3. To create tomcat resources run command from lesson-2 directory
```shell
helm install mt-tomcat charts/simple-chart/ -f charts/tomcat.yaml -n lesson-2
```
4. Validate that you were created all necessary resources:
```shell
 helm ls -n lesson-2
#NAME     	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART    	APP VERSION
#mt-nginx 	lesson-2 	1       	2022-04-11 18:16:03.141583873 +0400 +04	deployed	web-0.1.0	1.16.0     
#mt-tomcat	lesson-2 	1       	2022-04-11 18:16:39.208196117 +0400 +04	deployed	web-0.1.0	1.16.0 

kubectl get all -n lesson-2
# example output
#NAME                                        READY   STATUS    RESTARTS   AGE
#pod/mt-nginx-deployment-7bd8c9f996-q6mv7    1/1     Running   0          2m10s
#pod/mt-nginx-deployment-7bd8c9f996-rbv9g    1/1     Running   0          2m10s
#pod/mt-nginx-deployment-7bd8c9f996-s5cq5    1/1     Running   0          2m10s
#pod/mt-tomcat-deployment-7c495d748b-b7b22   1/1     Running   0          95s
#pod/mt-tomcat-deployment-7c495d748b-d2fmp   1/1     Running   0          95s
#
#NAME                        TYPE           CLUSTER-IP       EXTERNAL-IP                                                               PORT(S)        AGE
#service/mt-nginx-service    LoadBalancer   10.100.31.213    ae7179a8f3da7407f93602c198ed53c1-871896576.us-east-1.elb.amazonaws.com    80:31934/TCP   2m13s
#service/mt-tomcat-service   LoadBalancer   10.100.227.227   a3e2721b387fb4feba83639013bd8719-1967235925.us-east-1.elb.amazonaws.com   80:30703/TCP   98s
#
#NAME                                   READY   UP-TO-DATE   AVAILABLE   AGE
#deployment.apps/mt-nginx-deployment    3/3     3            3           2m15s
#deployment.apps/mt-tomcat-deployment   2/2     2            2           100s
#
#NAME                                              DESIRED   CURRENT   READY   AGE
#replicaset.apps/mt-nginx-deployment-7bd8c9f996    3         3         3       2m17s
#replicaset.apps/mt-tomcat-deployment-7c495d748b   2         2         2       102s
```
### Delete cluster after tests
```shell
eksctl delete cluster -f simple-cluster.yaml
```