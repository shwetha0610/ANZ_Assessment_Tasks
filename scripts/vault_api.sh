#!/bin/bash

# Environment variables
VAULT_ADDR=${VAULT_ADDR}
VAULT_TOKEN=${VAULT_TOKEN}

# Validate environment variables
if [[ -z "$VAULT_ADDR" || -z "$VAULT_TOKEN" ]]; then
  echo "ERROR: VAULT_ADDR or VAULT_TOKEN is not set"
  exit 1
fi

# API endpoint
URL="${VAULT_ADDR}/v1/secret/data/myapp"

echo "Calling Vault API..."

# API Call
HTTP_RESPONSE=$(curl -s \
  --write-out "HTTPSTATUS:%{http_code}" \
  --connect-timeout 5 \
  --max-time 10 \
  -H "X-Vault-Token: ${VAULT_TOKEN}" \
  "$URL")

# Extract response body and status
HTTP_BODY=$(echo "$HTTP_RESPONSE" | sed -e 's/HTTPSTATUS\:.*//g')
HTTP_STATUS=$(echo "$HTTP_RESPONSE" | tr -d '\n' | sed -e 's/.*HTTPSTATUS://')

# Handle response
if [ "$HTTP_STATUS" -eq 200 ]; then
  echo "SUCCESS: Secret retrieved"
  echo "$HTTP_BODY"

elif [ "$HTTP_STATUS" -eq 403 ]; then
  echo "ERROR: Permission denied"

elif [ "$HTTP_STATUS" -eq 404 ]; then
  echo "ERROR: Secret not found"

else
  echo "ERROR: Unexpected response"
  echo "HTTP Status: $HTTP_STATUS"
  echo "$HTTP_BODY"
fi
