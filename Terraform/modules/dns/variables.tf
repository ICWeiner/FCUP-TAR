# variables.tf - dns

variable "gcp_default_machine_type" {
  type    = string
}

variable "gcp_default_machine_image"{
  type    = string
  description = "Default OS image for the VMs"
}

variable "dns_pop_region" {
  type = string
  default = "europe-west1"
}

variable "dns_pop_zone" {
  type = string
  default = "-c"
}