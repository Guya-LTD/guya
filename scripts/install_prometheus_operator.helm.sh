#!/bin/sh

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo add stable https://kubernetes-charts.storage.googleapis.com/

helm repo update

helm install --namespace guya-ltd-monitoring --generate-name prometheus-community/kube-prometheus-stack