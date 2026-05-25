# Senior Engineer Assignment (IAM / Secrets Platform)

## Completed Tasks

- HashiCorp Vault Setup
- Vault Policy & IAM
- Kubernetes Automation
- CI/CD Design
- Python Scripting Task

---

# Task 1 - Vault Setup

## Start Vault

```bash
cd vault
docker-compose up -d

Export Environment Variables
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root

