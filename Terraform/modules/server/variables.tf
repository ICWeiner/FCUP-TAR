# variables.tf - server

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

variable "server_pop" {
  type = string
  default = "asia-northeast-1-c"
}