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
