#!/bin/bash

export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

vault audit enable file file_path=/tmp/vault_audit.log

echo "Audit logging enabled."