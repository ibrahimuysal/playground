variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/18"
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "dns_support" {
  type    = bool
  default = true
}

variable "dns_hostname" {
  type    = bool
  default = true
}

variable "k8s_version" {
  type    = string
  default = "1.21"
}

variable "k8s_cluster_name" {
  type    = string
  default = "eks"
}