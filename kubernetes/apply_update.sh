#!/bin/bash
# Release Name: kube-prometheus-stack
# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo update

helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack -n prometheus -f custom-values.yaml && \
kubectl delete pod $(kubectl get pods -n prometheus | grep prometheus-stack-prometheus-0 | awk '{print $1}') -n prometheus && \
watch kubectl get pods -n prometheus