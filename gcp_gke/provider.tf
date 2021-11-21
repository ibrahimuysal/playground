# # https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/v9.3.0/modules/auth

provider "google" {
  region = var.region
  project = var.project_id
  zone = var.region
}

provider "kubernetes" {
  load_config_file = false

  cluster_ca_certificate = module.gke_auth.cluster_ca_certificate
  host                   = module.gke_auth.host
  token                  = module.gke_auth.token
}


module "gke_auth" {
  source           = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  project_id       =  var.project_id
  cluster_name     = var.cluster_name
  location         =  var.region
}

