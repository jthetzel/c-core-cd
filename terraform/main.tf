# VPC Network
resource "google_compute_network" "vpc" {
  name                    = "${var.cluster_name}-vpc"
  auto_create_subnetworks = false
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.cluster_name}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.0.0.0/16"

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "10.1.0.0/16"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "10.2.0.0/16"
  }
}

# GKE Autopilot Cluster
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # Enable Autopilot
  enable_autopilot = true

  # Networking
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-ranges"
    services_secondary_range_name = "services-range"
  }

  # Deletion protection is usually recommended to be set to true for prod,
  # but false here for easier teardown during labs.
  deletion_protection = false
}
