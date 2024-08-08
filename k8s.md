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

## Pods
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: whatever
spec:
  containers:
    - name: whatever
      image: disooqi/alzwa:latest
      imagePullPolicy: Always
      command: [ "echo", "SUCCESS" ]
  imagePullSecrets:
    - name: myregistrykey
```

## Deployments
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: alzwa-deployment
  labels:
    app: alzwa
spec:
  replicas: 3
  selector:
    matchLabels:
      app: alzwa
  template:
    metadata:
      labels:
        app: alzwa
    spec:
      containers:
        - name: alzwa
          image: disooqi/alzwa:latest
          ports:
            - containerPort: 6800
      imagePullSecrets:
        - name: dockreg
  strategy:
    type: RollingUpdate
```

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

kubectl get pods  [-n <namespace>] [-w] [-o [wide|yaml]]
```

5. View application logs for a container in a pod.
```bash
kubectl logs <pod-name> [-n <namespace>] [-c <sidecar-container-name>]
```

## Services
Example servie config file:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: alzwa-pod
  labels:
    app.kubernetes.io/name: alzwa
spec:
  containers:
    - name: alzwa
      image: disooqi/alzwa:latest
      ports:
        - containerPort: 6800
          name: scrapyd-port
  imagePullSecrets:
    - name: dockreg

---
apiVersion: v1
kind: Service
metadata:
  name: alzwa-service
spec:
  selector:
    app.kubernetes.io/name: alzwa
  type: loadBalancer
  ports:
    - name: alzwa-service-port
      protocol: TCP
      port: 80
      targetPort: scrapyd-port
      nodePort: 30100  # starts from 30000
```

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

## Secrets
Example yaml config file for a secret component:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: alzwa-secret
  type: Opaque
data:
  redis-username: ZGVmYXVsdA==
  redis-password: SzFyNUZXQ3dJeldnRFpHbk1wcnBIdFF3UWQ1bzJ0RlE=
  redis-url: dsfd

# echo -n 'what-ever-data-you-want-to-encrypt' | base64
```
To generate a yaml file that holds Docker hub credentials:
```bash
# For Docker hub
kubectl create secret docker-registry dockhub-secret  --docker-server=https://index.docker.io/v1/ --docker-username=<dockerhub-username> --docker-password=<dockerhub-pat> --docker-email=<dockerhub-email>
kubectl create secret docker-registry dockreg  --docker-server=https://index.docker.io/v1/ --docker-username=disooqi --docker-password=<dockerhub-pat> --docker-email=docker@eldesouki.com -o yaml > docker-hub-secret.yaml
```

## [Configure a Pod to Use a ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
Use the option `--from-env-file` to create a ConfigMap from an env-file, for example:
```bash
kubectl create configmap a2-config --from-env-file=.env.test
```
would produce a ConfigMap. View the ConfigMap:
```bash
kubectl get configmap a2-config-env-file -o yaml
```

## Dashboard
```bash
kubectl apply -f dashboard-adminuser.yaml
kubectl -n kubernetes-dashboard create token admin-user
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
```

### Clean up
You can clean up the resources you created in your cluster:
```bash
kubectl delete service <service-name>
kubectl delete deployment <deploy-name>

# OR delete both with one line
kubectl delete svc,deploy -n a2 <service-name>
kubectl delete configmap -n a2 mta3-config
```

```bash
kubectl create secret docker-registry dockhub-secret  --docker-server=https://index.docker.io/v1/ --docker-username=disooqi --docker-password=dfddfs --docker-email=docker@eldesouki.com
kubectl get nodes
kubectl edit deployment <deploy-name>
kubectl apply -f file.yaml
kubectl delete -f mojrayat/alzwa-deployment.yaml

kubectl describe service <service-name>
kubectl describe pod <pod-name>

kubectl exec -it <pod-name> <container-name> <command>

# for example
kubectl exec -it <pod-name> <container-name> bin/bash
# when omitting <container-name> use '--' to separate the command from the <podname>
kubectl exec -it <pod-name> -- bin/bash
```

# Production
A Kubernetes cluster that handles production traffic should have a minimum of three nodes because if one node goes down, both an __etcd__ member and a control plane instance are lost, and redundancy is compromised.

## Digital Ocean

### Prerequisites
* Install [doctl](https://docs.digitalocean.com/reference/doctl/how-to/install/), the DigitalOcean command-line tool.
* Install kubectl, the Kubernetes command-line tool.

### Connect to a DigitalOcean Kubernetes Cluster
Go to digitalocean account home and select the cluster. Within the cluster page and in the overview tab, you will find the following command. This approach automatically renews your cluster’s certificate. Run the command below to authenticate:
```bash
doctl kubernetes cluster kubeconfig save c73ef98c-61eb-4a48-ae60-6bf4fdaaf831
```
Run the following to create a secret object for Docker Hub in the cluster after providing the dockerhub-tap.
```bash
kubectl create secret docker-registry dockhub-secret  --docker-server=https://index.docker.io/v1/ --docker-username=disooqi --docker-password=<dockerhub-pat> --docker-email=docker@eldesouki.com
```
