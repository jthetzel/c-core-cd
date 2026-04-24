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
