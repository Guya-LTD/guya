#!/bin/sh

helm repo add bitnami https://charts.bitnami.com/bitnami

#helm repo update

helm install --namespace guya-ltd catalog bitnami/mongodb --values values.yaml