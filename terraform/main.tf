module "vcn" {
  source                = "./network/vcn"
  compartment_ocid      = "${var.compartment_ocid}"
  tenancy_ocid          = "${var.tenancy_ocid}"
}

module "master" {
  source                = "./compute/instance/master"
  compartment_ocid      = "${var.compartment_ocid}"
  tenancy_ocid          = "${var.tenancy_ocid}"

  availability_domain   = "${lookup(data.oci_identity_availability_domains.all.availability_domains[0], "name")}"
  subnet_id             = "${module.vcn.subnet_ad_1_id}"
  shape                 = "${var.master_shape}"
  ssh_public_key        = "${var.ssh_public_key}"

  display_name_prefix   = "master-ad-1"
}

module "node_ad_1" {
  source                = "./compute/instance/node"
  compartment_ocid      = "${var.compartment_ocid}"
  tenancy_ocid          = "${var.tenancy_ocid}"

  availability_domain   = "${lookup(data.oci_identity_availability_domains.all.availability_domains[0], "name")}"
  subnet_id             = "${module.vcn.subnet_ad_1_id}"
  shape                 = "${var.node_shape}"
  ssh_public_key        = "${var.ssh_public_key}"

  display_name_prefix   = "node-ad-1"
}

module "node_ad_2" {
  source                = "./compute/instance/node"
  compartment_ocid      = "${var.compartment_ocid}"
  tenancy_ocid          = "${var.tenancy_ocid}"

  availability_domain   = "${lookup(data.oci_identity_availability_domains.all.availability_domains[1], "name")}"
  subnet_id             = "${module.vcn.subnet_ad_2_id}"
  shape                 = "${var.node_shape}"
  ssh_public_key        = "${var.ssh_public_key}"

  display_name_prefix   = "node-ad-2"
}

module "node_ad_3" {
  source                = "./compute/instance/node"
  compartment_ocid      = "${var.compartment_ocid}"
  tenancy_ocid          = "${var.tenancy_ocid}"

  availability_domain   = "${lookup(data.oci_identity_availability_domains.all.availability_domains[2], "name")}"
  subnet_id             = "${module.vcn.subnet_ad_3_id}"
  shape                 = "${var.node_shape}"
  ssh_public_key        = "${var.ssh_public_key}"

  display_name_prefix   = "node-ad-3"
}
