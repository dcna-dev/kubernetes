variable "project" {
  description = "Google Cloud Project"
  default = "project"
}

variable "region" {
  description = "Google Cloud Region"
  default = "us-central1"
}

variable "zone" {
  description = "Google Cloud Zone"
  default = "us-central1-c"
}

variable "node_count" {
  description = "Number of intances that will be created"
  default = "3"
}

variable "vm_type" {
  description = "VM instance type"
  default = "n1-standard-2"
}

variable "vm_image" {
  description = "VM instance image"
  default = "centos-7-v20190326"
}

variable "user" {
  description = "VM instance user"
  default = "root"
}
