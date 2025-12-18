#!/usr/bin/env bash

helm repo add cilium https://helm.cilium.io/
helm repo update

helm upgrade --install cilium cilium/cilium \
  --namespace kube-system \
  -f bootstrap/cilium/values.yaml \
  --wait
