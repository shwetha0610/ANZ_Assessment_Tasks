import os
import requests

VAULT_ADDR = os.getenv("VAULT_ADDR")
VAULT_TOKEN = os.getenv("VAULT_TOKEN")

headers = {
    "X-Vault-Token": VAULT_TOKEN
}

url = f"{VAULT_ADDR}/v1/secret/data/myapp"

try:
    response = requests.get(
        url,
        headers=headers,
        timeout=5
    )

    response.raise_for_status()

    data = response.json()

    print("Secret retrieved successfully")
    print(data)

    renew_url = f"{VAULT_ADDR}/v1/auth/token/renew-self"

    renew_response = requests.post(
        renew_url,
        headers=headers,
        timeout=5
    )

    print("Token renewed successfully")
    print(renew_response.json())

except requests.exceptions.Timeout:
    print("Request timed out")

except requests.exceptions.HTTPError as err:
    print(f"HTTP Error: {err}")

except Exception as e:
    print(f"Unexpected Error: {e}")