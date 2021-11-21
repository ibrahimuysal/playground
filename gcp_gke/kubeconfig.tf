# https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/v9.3.0/modules/auth

resource "local_file" "kubeconfig" {
  content  = module.gke_auth.kubeconfig_raw
  filename = "kubeconfig/gke.conf"
}