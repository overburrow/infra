#!/usr/bin/env bash

NAMESPACE=database
echo "Creating namespace: $NAMESPACE..."
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

PG_PASSWORD=$(openssl rand -base64 24)

echo "Generated Postgres Superuser Password: $PG_PASSWORD"

kubectl create secret generic cnpg-superuser-secret \
  --namespace $NAMESPACE \
  --from-literal=username=postgres \
  --from-literal=password="$PG_PASSWORD" \
  --dry-run=client -o yaml | kubectl apply -f -

