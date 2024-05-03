# Kubernetes

## Minikube

Create a minikube cluster
```bash
minikube start
```
Open the Dashboard (If you don't want minikube to open a web browser for you, run the `dashboard` subcommand with the `--url` flag)

```bash
minikube dashboard [--url]
```

View the kubectl configuration:
```bash
kubectl config view
```

## Deployment
1. Create Deployment:
```bash
# kubectl create deployment <deploy-name>
# Run a test container image that includes a webserver
kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
```

2. View the Deployment:
```bash
kubectl get deployments
kubectl get deployment
```

3. View cluster events:
```bash
kubectl get events
```

4. View the Pod:
```bash
kubectl get pods
kubectl get pod
```

5. View application logs for a container in a pod.
```bash
kubectl logs <pod-name>
```

## Service
By default, the Pod is only accessible by its internal IP address within the Kubernetes cluster. To make the Container accessible from outside the Kubernetes virtual network, you have to expose the Pod as a Kubernetes Service.
```bash
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
```


```bash
kubectl create secret docker-registry dockreg  --docker-server=https://index.docker.io/v1/ --docker-username=disooqi --docker-password=dfddfs --docker-email=docker@eldesouki.com

kubectl get nodes


kubectl edit deployment <deploy-name>
kubectl delete deployment <deploy-name>
kubectl apply -f file.yaml
kubectl delete -f mojrayat/alzwa-deployment.yaml

kubectl get service
kubectl describe service <service-name>


kubectl describe pod <pod-name>
kubectl exec -it <pod-name> -- bin/bash
```
# Production
A Kubernetes cluster that handles production traffic should have a minimum of three nodes because if one node goes down, both an __etcd__ member and a control plane instance are lost, and redundancy is compromised.
