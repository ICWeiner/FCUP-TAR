# variables.tf - dns

variable "gcp_region" {
  type    = string
}

variable "gcp_region_network" {
  type    = string
}

variable "gcp_default_machine_type" {
  type    = string
}

variable "gcp_default_machine_image"{
  type    = string
  description = "Default OS image for the VMs"
}

variable "dns_pop" {
  type = string
  default = "europe-west-1-c"
}