# Guya
Guya E-commerce &amp; Guya Express Microservice


chmod 700 get_helm.sh


kubectl create -f namespaces.yml

## Monitoring

### Edit Prometheus service

Since prometheus & grafana services are available within a cluster (ClusterIP is the default Kubernetes service), therefore they can not be accessed outside of cluster.

In order to access the web GUI from outside of cluster, on our local machine we need to change default ClusterIP services to NodePort (Kubernetes transparently routes incoming traffic on the NodePort to your service).


```bash
$ export EDITOR=vim

$ kubectl edit -n guya-ltd-monitoring service/prometheus-operator-{randNum}-prometheus
```

and change `type: ClusterIp` to `type: NodePort`