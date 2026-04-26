output "cluster_name" {
  description = "Cluster name"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "Cluster endpoint"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_location" {
  description = "Cluster location (region)"
  value       = google_container_cluster.primary.location
}

output "prefect_gateway_ip" {
  description = "Static IP for the Prefect Gateway — create an A record for var.prefect_domain pointing here"
  value       = google_compute_global_address.prefect_gateway.address
}

output "iap_client_id" {
  description = "OAuth2 client_id — use as client_id in the prefect-iap-secret Kubernetes Secret"
  value       = google_iap_client.prefect.client_id
}

output "iap_client_secret" {
  description = "OAuth2 client_secret — use as client_secret in the prefect-iap-secret Kubernetes Secret"
  value       = google_iap_client.prefect.secret
  sensitive   = true
}
