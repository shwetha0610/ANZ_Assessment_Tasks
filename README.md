# ANZ Assessment Tasks

## Completed Tasks

- HashiCorp Vault Setup
- Vault Policy & IAM
- Kubernetes Automation
- CI/CD Design
- Python Scripting Task
- Terraform IaC

---

# 1. HashiCorp Vault Setup

## Run Vault

```bash
docker-compose up -d
```

## Export Variables

```bash
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root
```

## Setup Vault

```bash
chmod +x vault/setup.sh
./vault/setup.sh
```

---

# 2. Kubernetes Deployment

## Deploy

```bash
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
```

---

# 3. Python Script

## Install

```bash
pip install -r scripts/requirements.txt
```

## Run

```bash
python3 scripts/vault_api.py
```

---

# 4. CI/CD

GitHub Actions workflow located at:

```text
cicd/github-actions.yml
```

---

# 5. Terraform

## Initialize

```bash
cd terraform
terraform init
terraform plan
```

---

# Security Best Practices

- No hardcoded credentials
- Environment variable usage
- Vault AppRole authentication
- IAM least privilege
- Audit logging enabled
- Secret rotation supported