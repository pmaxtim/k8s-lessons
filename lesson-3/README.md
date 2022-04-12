### Goals: 
- replace 2 Application Load Balancers to 1 ALB + Ingress controller
- attach ssl certificates and use real DNS name
- everything should be done by Helm charts
---
### Scheme:
![Scheme](../assets/lesson-3.jpg)
---
### How to create k8s resources with Helm:
1. Follow Lesson-1 Readme to create necessary Docker images and cluster
2. Create a "lesson-3" k8s namespace
```shell
kubectl create namespace lesson-3
```
3. Create nginx-ingress-controller. Run command from lesson-3 directory
```shell
helm install ingress-nginx charts/ingress-nginx/
```
4. Create nginx resources. Run command from lesson-3 directory
```shell
helm install nginx charts/nginx/ -n lesson-3
```
5. Create tomcat resources. Run command from lesson-3 directory
```shell
helm install tomcat charts/tomcat/ -n lesson-3
```

---

### Delete cluster after tests
```shell
eksctl delete cluster -f simple-cluster.yaml
```