# Multi-Environment Setup

## Environment Strategy

This project uses Terraform workspaces to manage separate dev and prod environments.

### Dev Environment
- **Purpose:** Development and testing
- **Cost:** ~$25-30/month
- **Instance Type:** t3.micro
- **RDS:** Single-AZ (db.t3.micro)
- **Auto Scaling:** 1-2 instances

### Prod Environment
- **Purpose:** Production-ready deployment
- **Cost:** ~$100-200/month (when running)
- **Instance Type:** t3.small
- **RDS:** Multi-AZ (db.t3.small)
- **Auto Scaling:** 2-6 instances

## Deployment Commands

### Deploy Dev
```bash
terraform workspace select dev
terraform apply -var-file=dev.tfvars
```

### Deploy Prod
```bash
terraform workspace select prod
terraform apply -var-file=prod.tfvars
```

## Why This Approach?

- **Cost Efficiency:** Dev uses minimal resources
- **Production Ready:** Prod has high availability
- **Easy Testing:** Can test changes in dev first
- **Isolated State:** Workspaces keep environments separate