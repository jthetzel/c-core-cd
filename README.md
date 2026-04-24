# c-core-cd
This repository hosts ArgoCD kustomize files for managing deployment to multiple kubernetes clusters.

## Infrastructure Deployment

This project uses Terraform to provision a GKE Autopilot cluster. To deploy the infrastructure, follow these steps:

1. **Prerequisites:** Ensure you have the `gcloud` CLI installed and authenticated with your Google Cloud account. You also need the `terraform` CLI installed.
2. **Authenticate with GCP:**
   ```bash
   gcloud auth application-default login
   ```
3. **Navigate to the Terraform directory:**
   ```bash
   cd terraform
   ```
4. **Initialize Terraform:**
   This downloads the required providers and initializes the working directory.
   ```bash
   terraform init
   ```
5. **Review the deployment plan:**
   This shows you what resources will be created.
   ```bash
   terraform plan
   ```
6. **Apply the changes:**
   This provisions the resources in GCP. You will need to type `yes` to confirm.
   ```bash
   terraform apply
   ```
