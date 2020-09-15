#!/bin/sh

helm install --namespace guya-ltd mongodb --version 9.1.2 stable/mongodb --values branchdb/values.yaml