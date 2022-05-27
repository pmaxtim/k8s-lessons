1. Install ArgoCD
```shell
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# make ArgoCD available from outside
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# get ArgoCD password. Username us 'admin'
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

# you can login via ArgoCLI 
argocd login {ARGO_HOSTNAME}
argocd account update-password
```

2. Find your cluster context
```shell
kubectl config get-contexts -o name
argocd cluster add {CLUSTER_CONTEXT}
```

3. Create an Application in ArgoCD from Git repo
