# AWS Infrastructure with CI/CD
   
   Production-ready AWS infrastructure deployed via GitHub Actions
   
   ## Features
   - Automated Terraform validation
   - OIDC authentication (no static credentials)
   - Multi-environment support
   
   ## Structure
   - `/terraform` - Infrastructure as Code
   - `/.github/workflows` - CI/CD pipelines
   - `/docs` - Architecture and runbooks


## 🔒 Security Scanning

This project implements automated security scanning using **tfsec** as part of the CI/CD pipeline.

### Security Checks
The pipeline automatically scans for:
- ✅ S3 bucket encryption and public access controls
- ✅ IAM permissions and least privilege policies
- ✅ Security group configurations and network rules
- ✅ Resource encryption settings (RDS, EBS, etc.)
- ✅ Secrets management best practices

### CI/CD Integration
- **Trigger:** Runs automatically on every push and pull request
- **Blocking:** Fails pipeline if critical/high severity issues detected
- **Visibility:** Security findings appear in GitHub Actions logs
- **Tool:** tfsec v1.28.14 (Aqua Security)

### Current Security Posture
- **Passed Checks:** 2
- **Active Findings:** 8 (tracked for remediation)
  - 6 HIGH: S3 bucket security configurations
  - 1 MEDIUM: S3 access logging
  - 1 LOW: Public access block definition

**Status:** Security scanning active and enforced ✅

### View Security Reports
Check the latest security scan results in the [GitHub Actions tab](../../actions/workflows/terraform-security.yml).