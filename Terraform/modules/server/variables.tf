# variables.tf - server

variable "gcp_default_machine_type" {
  type    = string
}

variable "gcp_default_machine_image"{
  type    = string
  description = "Default OS image for the VMs"
}

variable "server_pop_region" {
  type = string
  default = "asia-northeast1"
}

variable "server_pop_zone" {
  type = string
  default = "-c"
}

variable "gce_ssh_user" {
  type = string
}

variable "ssh_pub_key_path" {
  type = string
}