resource "google_container_cluster" "controlplane" {
  name = "${var.cluster_name}"
  project = var.project_id
  description = "Kubernetes lab environment on GCP"
  location = var.region

  master_auth {
    client_certificate_config {
        issue_client_certificate = false
    }
  }

  initial_node_count = var.node_count
  remove_default_node_pool = true
}

resource "google_container_node_pool" "dataplane" {
  name = "${var.cluster_name}-node-pool"
  project = var.project_id
  location = var.region
  cluster = google_container_cluster.controlplane.name
  node_count = var.node_count

    node_config {
        machine_type = var.node_machine_type
        oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        ]
        preemptible = var.node_preemptible
    }
}