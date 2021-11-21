variable "region" {
  type = string
}

variable "project_id" {
  type = string
}

variable "node_count" {
  type = number
  default = 1
}

variable "node_machine_type" {
  type = string
  default = "n1-standard-1"
}

variable "node_preemptible" {
  type = bool
  default = true
}

variable "cluster_name" {
  type = string
  default = "gcp_gke"
}
