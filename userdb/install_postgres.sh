#!/bin/sh

#helm repo add bitnami https://charts.bitnami.com/bitnami

helm install --namespace guya-ltd userdb bitnami/postgresql --values values.yaml
