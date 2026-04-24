# GKE Autopilot Cluster Plan

We will create a Terraform configuration that provisions a GKE Autopilot cluster in the `us-central1` region. As requested, we will keep the cluster minimal; Autopilot automatically manages the control plane (which is regional and HA by default), but we won't configure any workloads or extra node pools yet.

## Steps

*   **Create Terraform Configuration:** We will create a `terraform` directory containing the standard files (`main.tf`, `variables.tf`, `providers.tf`, `outputs.tf`).
*   **Provider Setup:** Configure the Google provider to use the project `c-core-labs` and region `us-central1` as defined in `CLAUDE.md`.
*   **Networking:** Create a dedicated VPC network and subnetwork for the GKE cluster to ensure proper isolation and IP addressing (following Terraform best practices).
*   **GKE Cluster:** Define the `google_container_cluster` resource with `enable_autopilot = true`. This will automatically manage the nodes and scaling.
*   **Save Plan:** According to the rules in `CLAUDE.md`, we will also save a copy of this plan to a markdown file in the `plans/` directory before proceeding with the implementation.

## Key Files to Change

*   `terraform/providers.tf`: Provider configuration.
*   `terraform/variables.tf`: Parameterize project ID, region, etc.
*   `terraform/main.tf`: VPC, Subnet, and GKE Autopilot cluster resources.
*   `terraform/outputs.tf`: Outputs for cluster connection details.
*   `plans/create-gke-autopilot.md`: A copy of this plan to satisfy repo rules.
