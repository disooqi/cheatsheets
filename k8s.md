# Kubernetes

## Minikube
To install:
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

To Create, stop, and delete:
```bash
# Create a minikube cluster
minikube start

# Stop the Minikube cluster
minikube stop

# delete the Minikube VM:
minikube delete
```


Open the Dashboard (If you don't want minikube to open a web browser for you, run the `dashboard` subcommand with the `--url` flag)

```bash
minikube dashboard [--url]
```

View the kubectl configuration:
```bash
kubectl config view
```

## Deployments
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
kubectl get pods [-o wide]
kubectl get pod
```

5. View application logs for a container in a pod.
```bash
kubectl logs <pod-name>
```

## Services
1. By default, the Pod is only accessible by its internal IP address within the Kubernetes cluster. To make the Container accessible from outside the Kubernetes virtual network, you have to expose the Pod as a Kubernetes Service. The `--type=LoadBalancer` flag indicates that you want to expose your Service outside of the cluster.
```bash
kubectl expose deployment alzwa-service --type=LoadBalancer --port=6800
minikube service alzwa-service  # This opens up a browser window that serves your app and shows the app's response.
```
* The scrapyd server inside the image only listens on TCP port 6800. If you used kubectl expose to expose a different port, clients could not connect to that other port.
* The `LoadBalancer` type makes the Service accessible through the minikube service command. 

2. View the Deployment:
```bash
kubectl get services
```

### Clean up
Now you can clean up the resources you created in your cluster:
```bash
kubectl delete service <service-name>
kubectl delete deployment <deploy-name>
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
