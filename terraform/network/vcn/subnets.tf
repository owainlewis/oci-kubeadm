resource "oci_core_subnet" "subnet_ad_1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.all.availability_domains[0], "name")}"
  cidr_block          = "${var.node_subnet_ad_1_cidr}"
  display_name        = "k8s-ad-1"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.vcn.id}"
  route_table_id      = "${oci_core_route_table.route_table.id}"
  security_list_ids   = ["${oci_core_security_list.node.id}"]
  dns_label           = "ad1"
  dhcp_options_id     = "${oci_core_virtual_network.vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "subnet_ad_2" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.all.availability_domains[1], "name")}"
  cidr_block          = "${var.node_subnet_ad_2_cidr}"
  display_name        = "k8s-ad-2"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.vcn.id}"
  route_table_id      = "${oci_core_route_table.route_table.id}"
  security_list_ids   = ["${oci_core_security_list.node.id}"]
  dns_label           = "ad2"
  dhcp_options_id     = "${oci_core_virtual_network.vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "subnet_ad_3" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.all.availability_domains[2], "name")}"
  cidr_block          = "${var.node_subnet_ad_3_cidr}"
  display_name        = "k8s-ad-3"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.vcn.id}"
  route_table_id      = "${oci_core_route_table.route_table.id}"
  security_list_ids   = ["${oci_core_security_list.node.id}"]
  dns_label           = "ad3"
  dhcp_options_id     = "${oci_core_virtual_network.vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "loadbalancer_subnet_1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.all.availability_domains[1], "name")}"
  cidr_block          = "${var.loadbalancer_subnet_1_cidr}"
  display_name        = "loadbalancer_1"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.vcn.id}"
  route_table_id      = "${oci_core_route_table.route_table.id}"
  security_list_ids   = ["${oci_core_security_list.node.id}"]
  dns_label           = "lbad1"
  dhcp_options_id     = "${oci_core_virtual_network.vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "loadbalancer_subnet_2" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.all.availability_domains[2], "name")}"
  cidr_block          = "${var.loadbalancer_subnet_2_cidr}"
  display_name        = "loadbalancer_2"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.vcn.id}"
  route_table_id      = "${oci_core_route_table.route_table.id}"
  security_list_ids   = ["${oci_core_security_list.node.id}"]
  dns_label           = "lbad2"
  dhcp_options_id     = "${oci_core_virtual_network.vcn.default_dhcp_options_id}"
}
