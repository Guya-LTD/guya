#!/bin/sh

helm repo add bitnami https://charts.bitnami.com/bitnami

helm install --namespace guya-ltd chatdb stable/postgresql --values values.yaml