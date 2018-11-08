variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "node_shape" {
  default = "VM.Standard2.1"
}

variable "master_shape" {
  default = "VM.Standard2.1"
}

variable "ssh_public_key" {
  description = "SSH public key in OpenSSH authorized_keys format for instances (generated if left blank)"
  type        = "string"
  default     = ""
}
