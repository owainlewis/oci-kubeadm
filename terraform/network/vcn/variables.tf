variable "tenancy_ocid" {}
variable "compartment_ocid" {}

variable vcn_cidr {
  default = "10.0.0.0/16"
}

variable node_subnet_ad_1_cidr {
  default = "10.0.0.0/24"
}

variable node_subnet_ad_2_cidr {
  default = "10.0.1.0/24"
}

variable node_subnet_ad_3_cidr {
  default = "10.0.2.0/24"
}

variable loadbalancer_subnet_1_cidr {
  default = "10.0.3.0/26"
}

variable loadbalancer_subnet_2_cidr {
  default = "10.0.4.0/26"
}
