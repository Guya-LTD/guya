#!/bin/sh

helm repo add elastic https://helm.elastic.co

helm repo update

# for multi node
#curl -O https://raw.githubusercontent.com/elastic/Helm-charts/master/elasticsearch/examples/minikube/values.yaml

helm install --namespace guya-ltd-elk elastic/elasticsearch --generate-name

helm install --namespace guya-ltd-elk elastic/logstash --generate-name

helm install --namespace guya-ltd-elk elastic/kibana --generate-name

#rm values.yml