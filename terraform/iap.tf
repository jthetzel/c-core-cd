# Static IP for the Prefect Gateway load balancer.
# After `terraform apply`, add an A record for var.prefect_domain pointing to
# the `prefect_gateway_ip` output before the managed certificate will provision.
resource "google_compute_global_address" "prefect_gateway" {
  name    = "prefect-gateway-ip"
  project = var.project_id
}

# IAP OAuth consent screen. Only one brand is allowed per GCP project.
# If a brand already exists (e.g. created via Console), import it first:
#   terraform import google_iap_brand.default projects/<project_number>/brands/<brand_id>
resource "google_iap_brand" "default" {
  support_email     = var.iap_support_email
  application_title = "C-Core Labs"
  project           = var.project_id
}

# OAuth2 client used by IAP to authenticate users before forwarding to Prefect.
resource "google_iap_client" "prefect" {
  display_name = "Prefect IAP Client"
  brand        = google_iap_brand.default.name
}

# Google-managed TLS certificate for the Prefect domain.
resource "google_certificate_manager_certificate" "prefect" {
  name    = "prefect-cert"
  project = var.project_id

  managed {
    domains = [var.prefect_domain]
  }
}

# Certificate map referenced by the Gateway's networking.gke.io/certmap annotation.
resource "google_certificate_manager_certificate_map" "prefect" {
  name    = "prefect-cert-map"
  project = var.project_id
}

resource "google_certificate_manager_certificate_map_entry" "prefect" {
  name         = "prefect-cert-entry"
  project      = var.project_id
  map          = google_certificate_manager_certificate_map.prefect.name
  certificates = [google_certificate_manager_certificate.prefect.id]
  hostname     = var.prefect_domain
}

# Grant IAP access to the specified members.
# To restrict to only the Prefect backend service (rather than all IAP resources
# in the project), replace with google_iap_web_backend_service_iam_member using
# the backend service name from `kubectl get backendconfig -n prefect` after the
# first Gateway deployment.
resource "google_project_iam_member" "prefect_iap_access" {
  for_each = toset(var.iap_allowed_members)

  project = var.project_id
  role    = "roles/iap.httpsResourceAccessor"
  member  = each.value
}
