#!/bin/sh

helm install --namespace guya-ltd-elk logstash --version 7.9.1 elastic/logstash --values logstash/values.yaml