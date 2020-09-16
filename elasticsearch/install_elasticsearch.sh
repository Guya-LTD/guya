#!/bin/sh

kubectl apply -f elasticsearch/local-path-storage.yaml

helm install --namespace guya-ltd-elk elasticsearch --version 7.9.1 elastic/elasticsearch --values elasticsearch/values.yaml
