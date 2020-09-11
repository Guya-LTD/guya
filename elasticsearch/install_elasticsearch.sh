#!/bin/sh

helm install --namespace guya-ltd-elk elasticsearch --version 7.9.1 elastic/elasticsearch --values elasticsearch/values.yaml
