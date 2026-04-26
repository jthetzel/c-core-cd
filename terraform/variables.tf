variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = string
  default     = "c-core-labs"
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "The name of the GKE Autopilot cluster"
  type        = string
  default     = "c-core-autopilot"
}

variable "iap_support_email" {
  description = "Support email shown on the Google OAuth consent screen"
  type        = string
}

variable "prefect_domain" {
  description = "Domain name for the Prefect server (e.g. prefect.example.com)"
  type        = string
}

variable "iap_allowed_members" {
  description = "IAM members granted IAP access to Prefect (e.g. 'user:alice@example.com', 'group:editors@example.com')"
  type        = list(string)
  default     = []
}
