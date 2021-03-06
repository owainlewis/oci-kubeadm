variable "tenancy_ocid" {}
variable "compartment_ocid" {}

variable "count" {
  default = "1"
}

variable "availability_domain" {}
variable "shape" {}
variable "subnet_id" {}

variable "display_name_prefix" {}

variable "oracle_linux_image_name" {
  default = "Oracle-Linux-7.5-2018.09.25-0"
}

variable "ssh_public_key" {
  description = "SSH public key in OpenSSH authorized_keys format for instances (generated if left blank)"
  type        = "string"
  default     = ""
}
