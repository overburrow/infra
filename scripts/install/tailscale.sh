#!/usr/bin/env bash

helm repo add tailscale https://pkgs.tailscale.com/helmcharts
helm repo update

kubectl create namespace tailscale

helm upgrade --install tailscale-operator tailscale/tailscale-operator \
  --namespace=tailscale \
  --create-namespace \
  --set-string oauth.clientId=$TAILSCALE_CLIENT_ID \
  --set-string oauth.clientSecret=$TAILSCALE_CLIENT_SECRET \
  --wait
