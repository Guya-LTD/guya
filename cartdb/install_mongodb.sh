#!/bin/sh

helm repo add bitnami https://charts.bitnami.com/bitnami

#helm repo update

helm install --namespace guya-ltd cartdb --version 9.1.2 bitnami/mongodb --values values.yaml