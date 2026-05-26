#!/bin/bash

export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

echo "Enabling KV v2..."
vault secrets enable -path=secret kv-v2

echo "Creating secret..."
vault kv put secret/myapp username=admin password=test123

echo "Retrieving secret..."
vault kv get secret/myapp

echo "Enabling AppRole..."
vault auth enable approle

echo "Writing policy..."
vault policy write myapp-policy vault/policy.hcl

echo "Creating AppRole..."
vault write auth/approle/role/myapp-role \
token_policies="myapp-policy"

echo "Vault setup completed."