#!/bin/bash

export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

echo "Fetching Role ID..."
vault read auth/approle/role/myapp-role/role-id

echo "Generating Secret ID..."
vault write -f auth/approle/role/myapp-role/secret-id